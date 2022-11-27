import 'package:easy_logger/easy_logger.dart';

class AppLoggers {
  /// Logger for remote data source.
  ///
  static final EasyLogger remoteDateSoureLogger = EasyLogger(
    name: 'Remote Data Source',
    defaultLevel: LevelMessages.debug,
    enableBuildModes: [BuildMode.debug],
    enableLevels: [
      LevelMessages.debug,
      LevelMessages.info,
      LevelMessages.error,
      LevelMessages.warning
    ],
  );

  /// Logger for local data source.
  ///
  static final EasyLogger localDateSoureLogger = EasyLogger(
    name: 'Local Data Source',
    defaultLevel: LevelMessages.debug,
    enableBuildModes: [BuildMode.debug],
    enableLevels: [
      LevelMessages.debug,
      LevelMessages.info,
      LevelMessages.error,
      LevelMessages.warning
    ],
  );
}
