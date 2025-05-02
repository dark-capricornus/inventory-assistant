import numpy as np
import tensorflow as tf
from typing import Dict, Any, Tuple, List

class SalesPredictor:
    """LSTM model for predicting sales based on historical data."""
    
    def __init__(self) -> None:
        """Initialize the sales predictor with an LSTM model."""
        self.model = self._build_model()
        self.sequence_length = 30  # Number of days to look back

    def _build_model(self) -> tf.keras.Model:
        """
        Build and compile the LSTM model.
        
        Returns:
            tf.keras.Model: Compiled LSTM model
        """
        model = tf.keras.Sequential([
            tf.keras.layers.LSTM(50, return_sequences=True, input_shape=(self.sequence_length, 1)),
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
            data: Dictionary containing sales data
            
        Returns:
            Tuple[np.ndarray, np.ndarray]: Prepared input sequences and targets
        """
        # Convert data to numpy array
        sales_data = np.array(data['sales'])
        
        # Create sequences
        X, y = [], []
        for i in range(len(sales_data) - self.sequence_length):
            X.append(sales_data[i:(i + self.sequence_length)])
            y.append(sales_data[i + self.sequence_length])
        
        return np.array(X), np.array(y)

    def predict(self, data: Dict[str, List[float]]) -> Dict[str, Any]:
        """
        Make sales predictions.
        
        Args:
            data: Dictionary containing sales data
            
        Returns:
            Dict[str, Any]: Prediction results with confidence
        """
        try:
            # Prepare data
            X, _ = self._prepare_data(data)
            
            # Make prediction
            prediction = self.model.predict(X[-1:])
            
            return {
                'predicted_sales': float(prediction[0][0]),
                'confidence': 0.85  # Placeholder for model confidence
            }
        except Exception as e:
            raise ValueError(f"Error making prediction: {str(e)}") 