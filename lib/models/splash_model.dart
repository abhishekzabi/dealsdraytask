// models/device_info_model.dart

class DeviceInfoModel {
  final String deviceType;
  final String deviceId;
  final String deviceName;
  final String deviceOSVersion;
  final String deviceIPAddress;
  final double lat;
  final double long;
  final String buyerGcmid;
  final String buyerPemid;
  final AppInfo app;

  DeviceInfoModel({
    required this.deviceType,
    required this.deviceId,
    required this.deviceName,
    required this.deviceOSVersion,
    required this.deviceIPAddress,
    required this.lat,
    required this.long,
    required this.buyerGcmid,
    required this.buyerPemid,
    required this.app,
  });

  factory DeviceInfoModel.fromJson(Map<String, dynamic> json) {
    return DeviceInfoModel(
      deviceType: json['deviceType'],
      deviceId: json['deviceId'],
      deviceName: json['deviceName'],
      deviceOSVersion: json['deviceOSVersion'],
      deviceIPAddress: json['deviceIPAddress'],
      lat: json['lat'].toDouble(),
      long: json['long'].toDouble(),
      buyerGcmid: json['buyer_gcmid'],
      buyerPemid: json['buyer_pemid'],
      app: AppInfo.fromJson(json['app']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceType': deviceType,
      'deviceId': deviceId,
      'deviceName': deviceName,
      'deviceOSVersion': deviceOSVersion,
      'deviceIPAddress': deviceIPAddress,
      'lat': lat,
      'long': long,
      'buyer_gcmid': buyerGcmid,
      'buyer_pemid': buyerPemid,
      'app': app.toJson(),
    };
  }
}

class AppInfo {
  final String version;
  final DateTime installTimeStamp;
  final DateTime uninstallTimeStamp;
  final DateTime downloadTimeStamp;

  AppInfo({
    required this.version,
    required this.installTimeStamp,
    required this.uninstallTimeStamp,
    required this.downloadTimeStamp,
  });

  factory AppInfo.fromJson(Map<String, dynamic> json) {
    return AppInfo(
      version: json['version'],
      installTimeStamp: DateTime.parse(json['installTimeStamp']),
      uninstallTimeStamp: DateTime.parse(json['uninstallTimeStamp']),
      downloadTimeStamp: DateTime.parse(json['downloadTimeStamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'installTimeStamp': installTimeStamp.toIso8601String(),
      'uninstallTimeStamp': uninstallTimeStamp.toIso8601String(),
      'downloadTimeStamp': downloadTimeStamp.toIso8601String(),
    };
  }
}
