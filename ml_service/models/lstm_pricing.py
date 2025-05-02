import numpy as np
import tensorflow as tf
from typing import Dict, Any, Tuple, List

class PricingOptimizer:
    """LSTM model for optimizing pricing based on historical data and market conditions."""
    
    def __init__(self) -> None:
        """Initialize the pricing optimizer with an LSTM model."""
        self.model = self._build_model()
        self.sequence_length = 30  # Number of days to look back

    def _build_model(self) -> tf.keras.Model:
        """
        Build and compile the LSTM model.
        
        Returns:
            tf.keras.Model: Compiled LSTM model
        """
        model = tf.keras.Sequential([
            tf.keras.layers.LSTM(50, return_sequences=True, input_shape=(self.sequence_length, 3)),  # 3 features: price, demand, competitor_price
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
            data: Dictionary containing price, demand, and competitor price data
            
        Returns:
            Tuple[np.ndarray, np.ndarray]: Prepared input sequences and targets
        """
        # Convert data to numpy arrays
        prices = np.array(data['prices'])
        demand = np.array(data['demand'])
        competitor_prices = np.array(data['competitor_prices'])
        
        # Combine features
        features = np.column_stack((prices, demand, competitor_prices))
        
        # Create sequences
        X, y = [], []
        for i in range(len(features) - self.sequence_length):
            X.append(features[i:(i + self.sequence_length)])
            y.append(prices[i + self.sequence_length])
        
        return np.array(X), np.array(y)

    def optimize(self, data: Dict[str, List[float]]) -> Dict[str, Any]:
        """
        Optimize pricing based on market conditions.
        
        Args:
            data: Dictionary containing price, demand, and competitor price data
            
        Returns:
            Dict[str, Any]: Optimization results with suggested prices
        """
        try:
            # Prepare data
            X, _ = self._prepare_data(data)
            
            # Make prediction
            prediction = self.model.predict(X[-1:])
            
            # Calculate optimal price
            current_price = data['prices'][-1]
            competitor_price = data['competitor_prices'][-1]
            demand = data['demand'][-1]
            
            optimal_price = float(prediction[0][0])
            
            # Adjust price based on market conditions
            if competitor_price < current_price:
                optimal_price = min(optimal_price, competitor_price * 1.1)  # Don't price more than 10% above competitor
            elif demand < 0.5:  # Low demand
                optimal_price = min(optimal_price, current_price * 0.9)  # Reduce price by up to 10%
            
            return {
                'optimal_price': optimal_price,
                'price_change': optimal_price - current_price,
                'price_change_percentage': ((optimal_price - current_price) / current_price) * 100,
                'confidence': 0.85  # Placeholder for model confidence
            }
        except Exception as e:
            raise ValueError(f"Error optimizing pricing: {str(e)}") 