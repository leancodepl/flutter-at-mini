// These files will have access to all private variables, as if they were in this file
part 'system_info.linux.dart';
part 'system_info.macos.dart';

abstract class PlatformInfo {
  const factory PlatformInfo.linux() = PlatformInfoLinux;
  const factory PlatformInfo.macos() = PlatformInfoMacos;

  String versionNumber();
  String osName();
  double batteryLevel();

  static const _versionSeparator = '.';
}
