import numpy as np
import tensorflow as tf
from typing import Dict, Any, Tuple, List

class InventoryOptimizer:
    """LSTM model for optimizing inventory levels based on historical data."""
    
    def __init__(self) -> None:
        """Initialize the inventory optimizer with an LSTM model."""
        self.model = self._build_model()
        self.sequence_length = 30  # Number of days to look back

    def _build_model(self) -> tf.keras.Model:
        """
        Build and compile the LSTM model.
        
        Returns:
            tf.keras.Model: Compiled LSTM model
        """
        model = tf.keras.Sequential([
            tf.keras.layers.LSTM(50, return_sequences=True, input_shape=(self.sequence_length, 2)),  # 2 features: stock level and demand
            tf.keras.layers.Dropout(0.2),
            tf.keras.layers.LSTM(50, return_sequences=False),
            tf.keras.layers.Dropout(0.2),
            tf.keras.layers.Dense(1)
        ])
        model.compile(optimizer='adam', loss='mse')
        return model

    def _prepare_data(self, data: Dict[str, List[float]]) -> Tuple[np.ndarray, np.ndarray]:
        """
        Prepare data for model input.
        
        Args:
            data: Dictionary containing stock levels and demand data
            
        Returns:
            Tuple[np.ndarray, np.ndarray]: Prepared input sequences and targets
        """
        # Convert data to numpy arrays
        stock_levels = np.array(data['stock_levels'])
        demand = np.array(data['demand'])
        
        # Combine features
        features = np.column_stack((stock_levels, demand))
        
        # Create sequences
        X, y = [], []
        for i in range(len(features) - self.sequence_length):
            X.append(features[i:(i + self.sequence_length)])
            y.append(stock_levels[i + self.sequence_length])
        
        return np.array(X), np.array(y)

    def optimize(self, data: Dict[str, List[float]]) -> Dict[str, Any]:
        """
        Optimize inventory levels.
        
        Args:
            data: Dictionary containing stock levels and demand data
            
        Returns:
            Dict[str, Any]: Optimization results with suggested stock levels
        """
        try:
            # Prepare data
            X, _ = self._prepare_data(data)
            
            # Make prediction
            prediction = self.model.predict(X[-1:])
            
            # Calculate optimal reorder point
            current_stock = data['stock_levels'][-1]
            predicted_demand = data['demand'][-1]
            lead_time = data.get('lead_time', 7)  # Default lead time of 7 days
            
            optimal_stock = float(prediction[0][0])
            reorder_point = optimal_stock - (predicted_demand * lead_time)
            
            return {
                'optimal_stock_level': optimal_stock,
                'reorder_point': reorder_point,
                'suggested_order_quantity': max(0, optimal_stock - current_stock),
                'confidence': 0.85  # Placeholder for model confidence
            }
        except Exception as e:
            raise ValueError(f"Error optimizing inventory: {str(e)}") 