class Constants {
  static const int firestoreArrayFilterMaximumSize = 30;
  static const int distanceFilter = 10;
  static const double defaultLongitude = 50.4798308;
  static const double defaultLatitude = 30.5981753;

  static const int defaultWalkingMinutes = 30;

  static const Duration defaultPageLoadDuration = Duration(milliseconds: 250);

  static const String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String passwordRegex =
      r'^(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}';
  static const String phoneNumberRegex =
      r"^\+?(\d{1,3})?[-.\s]?(\(?\d{1,4}\)?)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$";
  static const String urlRegex =
      r"^(https?:\/\/)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(:\d+)?(\/[^\s]*)?$";
  static const String aiValidationJsonRegex = "(?:```json)|(?:```)";

  static const String mapStyleLocation = 'assets/map_style.json';
  static const String notificationServiceLocation =
      'assets/notification_service.json';
  static const String configLocation = 'assets/config.json';

  static const String commentsLocaleKey = "Comments.other";

  static const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
}
