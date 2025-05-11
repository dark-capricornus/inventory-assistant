# Inventory Management System

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Platform](https://img.shields.io/badge/platform-Web%20%7C%20Android%20%7C%20iOS-lightgrey)

## Overview

The Inventory Management System is a comprehensive solution designed to streamline inventory tracking, sales management, and supply chain operations for businesses of all sizes. This multi-component system offers real-time inventory tracking, ML-powered forecasting, and seamless cross-platform functionality.

## System Architecture

The system consists of several integrated components:

- **Flutter Client (inventory_management_system_flutter)**: Cross-platform mobile and web application
- **Backend Server (inventory_management_system_server)**: Dart-based API server
- **Client API Library (inventory_management_system_client)**: Dart client for API integration
- **Machine Learning Service (ml_service)**: Python-based predictive analytics engine
- **Companion Flutter Apps**:
  - Inventory Assistant Flutter: Specialized companion app
  - Inventory Assistant Server: Supporting services

## Key Features

### Inventory Management
- Real-time inventory tracking and updates
- Barcode/QR code scanning functionality
- Low stock alerts and automatic reordering
- Multiple warehouse and location support
- Batch and serial number tracking

### Sales & Purchase Management
- Streamlined order processing
- Invoice and receipt generation
- Purchase order management
- Vendor and supplier database
- Customer relationship management

### Analytics & Reporting
- Customizable dashboards
- Sales trends and performance metrics
- Inventory turnover analysis
- Export reports in multiple formats (PDF, CSV, Excel)
- Scheduled reporting via email

### Machine Learning Capabilities
- **Demand Forecasting**: LSTM-based sales prediction models
- **Optimal Pricing Strategies**: Price optimization based on market trends
- **Inventory Optimization**: Suggestions for optimal stock levels

### Security Features
- Role-based access control
- Comprehensive audit logs
- Secure API endpoints
- Data encryption in transit and at rest
- Compliance with data protection regulations

### Cross-Platform Support
- Works on Android, iOS, web platforms
- Responsive design for various screen sizes
- Offline functionality with data synchronization

## Technical Advantages

- **Scalable Architecture**: Microservices design allows for easy scaling
- **Flutter Framework**: Single codebase for multiple platforms
- **Dart Backend**: Type-safe and efficient server implementation
- **Real-time Updates**: WebSocket integration for instant data propagation
- **Machine Learning Integration**: Python-based predictive models for business intelligence
- **Containerized Deployment**: Docker support for consistent deployment
- **Cloud Ready**: Deployment configurations for AWS and GCP

## Getting Started

### Prerequisites
- Flutter SDK (latest version)
- Dart SDK (latest version)
- Python 3.8+ (for ML service)
- Docker and Docker Compose (for containerized deployment)

### Installation

#### Client Setup
```bash
cd inventory_management_system_flutter
flutter pub get
flutter run
```

#### Server Setup
```bash
cd inventory_management_system_server
dart pub get
dart bin/main.dart
```

#### ML Service Setup
```bash
cd ml_service
pip install -r requirements.txt
python app.py
```

### Configuration

System configuration files are located in:
- Server: `inventory_management_system_server/config/`
- ML Service: Environment variables defined in `ml_service/.env`

## Deployment

### Local Development
The system can be run locally using the included Docker Compose configuration:
```bash
docker-compose up
```

### Production Deployment
Deployment scripts are available for:
- AWS: See `inventory_management_system_server/deploy/aws/`
- GCP: See `inventory_management_system_server/deploy/gcp/`

## API Documentation

API endpoints are documented in:
- `inventory_management_system_client/doc/endpoint.md`

## Support

For questions and support, please open an issue in the project repository or contact the development team.