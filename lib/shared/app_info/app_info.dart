import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoHandler {
  static PackageInfo? _packageInfo;

  /// init the package info
  Future<void> initPackageInfo() async =>
      _packageInfo ??= await PackageInfo.fromPlatform();

  String get appName => _packageInfo?.appName ?? 'Unknown';

  String get packageNameInfo => _packageInfo?.packageName ?? 'Unknown';
  String get version => _packageInfo?.version ?? 'Unknown';

  String get versionView => 'V $version.$buildNumber';

  String get buildNumber => _packageInfo?.buildNumber ?? 'Unknown';

  String get buildSignature => _packageInfo?.buildSignature ?? 'Unknown';

  String get installerStore => _packageInfo?.installerStore ?? 'Not available';
}
