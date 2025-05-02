from flask import Flask, request, jsonify
from flask_cors import CORS
from models.lstm_sales import SalesPredictor
from models.lstm_inventory import InventoryOptimizer
from models.lstm_pricing import PricingOptimizer
from typing import Dict, Any

app = Flask(__name__)
CORS(app)

# Initialize models
sales_predictor = SalesPredictor()
inventory_optimizer = InventoryOptimizer()
pricing_optimizer = PricingOptimizer()

@app.route('/predict/sales', methods=['POST'])
def predict_sales() -> Dict[str, Any]:
    """
    Predict sales based on historical data.
    
    Returns:
        Dict[str, Any]: JSON response containing sales prediction and confidence
    """
    try:
        data = request.json
        if not data:
            return jsonify({'error': 'No data provided'}), 400
            
        prediction = sales_predictor.predict(data)
        return jsonify(prediction)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/optimize/inventory', methods=['POST'])
def optimize_inventory() -> Dict[str, Any]:
    """
    Optimize inventory levels based on historical data.
    
    Returns:
        Dict[str, Any]: JSON response containing inventory optimization suggestions
    """
    try:
        data = request.json
        if not data:
            return jsonify({'error': 'No data provided'}), 400
            
        optimization = inventory_optimizer.optimize(data)
        return jsonify(optimization)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/optimize/pricing', methods=['POST'])
def optimize_pricing() -> Dict[str, Any]:
    """
    Optimize pricing based on historical data and market conditions.
    
    Returns:
        Dict[str, Any]: JSON response containing pricing optimization suggestions
    """
    try:
        data = request.json
        if not data:
            return jsonify({'error': 'No data provided'}), 400
            
        pricing = pricing_optimizer.optimize(data)
        return jsonify(pricing)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000) 