class AppStrings {
  /// String for UserListScreen route.
  static const String usersList = '/usersList';

  /// String for UserDetailsScreen route.
  static const String userDetails = 'userDetails';

  /// String for userId for UserDetailsScreen.
  static const String userId = 'userId';

  /// Default string value for server failure message.
  ///
  static const String defaultServerFailureMessage =
      'Failed to fetch data from the server';

  /// Default string value for local storage failure message.
  ///
  static const String defaultLocalStorageFailureMessage =
      'Failed to fetch data from the local starage';

  /// Default string value for server exception message.
  ///
  static const String defaultServerExceptionMessage =
      'Failed to fetch data from the server';

  /// Default string value for local storage exception message.
  ///
  static const String defaultLocalStorageExceptionMessage =
      'Failed to fetch data from the local starage';

  /// String key for caching users list
  /// data in shared preferences.
  ///
  static const String cachedUsersList = 'usersList';

  /// String key for caching user details
  /// in shared preferences. Must be concatenated
  /// with '#<userId>'.
  ///
  static const String cachedUserDetails = 'user';
}
