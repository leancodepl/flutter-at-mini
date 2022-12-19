// Match the `part` directive in the original file
part of 'system_info.dart';

class PlatformInfoLinux implements PlatformInfo {
  const PlatformInfoLinux();

  @override
  double batteryLevel() {
    return 0.5;
  }

  @override
  String osName() {
    return 'GNU/Linux';
  }

  @override
  String versionNumber() {
    return [6, 1, 0].join(PlatformInfo._versionSeparator);
  }
}
