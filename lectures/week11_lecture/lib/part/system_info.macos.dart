// Match the `part` directive in the original file
part of 'system_info.dart';

class PlatformInfoMacos implements PlatformInfo {
  const PlatformInfoMacos();

  @override
  double batteryLevel() {
    return 1;
  }

  @override
  String osName() {
    return 'Darwin';
  }

  @override
  String versionNumber() {
    return [13, 0, 1].join(PlatformInfo._versionSeparator);
  }
}
