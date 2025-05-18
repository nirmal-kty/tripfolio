# TripFolio

## Overview
TripFolio is a comprehensive public transportation management system that enables real-time tracking of public buses and provides access to their schedules. The platform consists of a mobile application for passengers and bus staff, along with a web dashboard for administrative purposes and bus owners.

## Features

### Mobile Application
- **Real-time Bus Tracking**: Track the current location of buses on routes
- **Schedule Viewing**: Access up-to-date bus schedules
- **Route Information**: View detailed routes and bus stops
- **User Authentication**: Separate login systems for passengers and bus staff
- **Staff Data Collection**: Staff members can update daily passenger data

### Web Dashboard
- **Admin Panel**: Monitor system operations, review schedules, and manage user feedback
- **Owner Management**: Bus owners can register new buses and manage their fleet
- **Staff Management**: Owners can add and manage staff members
- **Bus Authorization**: Admins can approve or reject new bus registrations
- **Passenger Demand Prediction**: AI-powered forecasting using Long Short-Term Memory (LSTM) models

## Technology Stack
- **Backend**: Django (Python web framework)
- **Mobile App**: Flutter (Cross-platform mobile framework)
- **Database**: MySQL with SQLyog as the database management tool
- **Maps Integration**: Google Maps API for real-time location tracking and route visualization
- **Machine Learning**: LSTM model for passenger demand prediction
- **Data Collection**: Daily operational data collected via staff mobile app

## Installation

### Prerequisites
- Python 3.8 or higher
- Flutter 2.0 or higher
- MySQL 8.0 or higher
- SQLyog
- Google Maps API key

### Backend Setup
1. Clone the repository:
```bash
git clone https://github.com/nirmal-kty/tripfolio.git
cd tripfolio
```

2. Create and activate a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Configure the database in `settings.py`

5. Run migrations:
```bash
python manage.py migrate
```

6. Start the development server:
```bash
python manage.py runserver
```

### Mobile App Setup
1. Navigate to the mobile app directory:
```bash
cd mobile_app
```

2. Install Flutter dependencies:
```bash
flutter pub get
```

3. Add your Google Maps API key in the appropriate configuration files

4. Run the app:
```bash
flutter run
```

## Project Structure
```
tripfolio/
├── backend/                # Django project
│   ├── api/                # REST API endpoints
│   ├── dashboard/          # Web dashboard application
│   ├── prediction/         # LSTM model for passenger prediction
│   └── users/              # User authentication and management
├── mobile_app/             # Flutter mobile application
│   ├── lib/
│   │   ├── screens/        # App screens
│   │   ├── models/         # Data models
│   │   ├── services/       # API services
│   │   └── utils/          # Utility functions
│   └── assets/             # App assets
└── docs/                   # Documentation
```

## Usage

### For Passengers
1. Download and install the TripFolio app
2. Create a user account
3. Browse available bus routes and schedules
4. Track buses in real-time on the map
5. Get notifications about bus arrivals

### For Bus Owners
1. Access the web dashboard using owner credentials
2. Register new buses with required documentation
3. Manage staff assignments
4. View operational analytics and passenger data

### For Bus Staff
1. Use the staff login in the mobile app
2. Update daily passenger counts and operational data
3. Manage schedule adherence

### For Administrators
1. Access the admin dashboard
2. Approve or reject new bus registrations
3. Monitor user feedback
4. View passenger demand predictions
5. Manage system settings

## Future Enhancements
- Fare payment integration
- Push notifications for schedule changes
- Enhanced predictive analytics
- Multilingual support
- Accessibility features

## Contributing
1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Commit your changes (`git commit -m 'Add some amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

## License
This project is licensed under the MIT License - see the LICENSE file for details.

