// services/device_service.dart

import 'package:dealsdray/models/splash_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeviceService {
  static const String _baseUrl = 'http://devapiv4.dealsdray.com/api/v2/user/device/add';

  Future<bool> sendDeviceInfo(DeviceInfoModel model) async {
    final url = Uri.parse(_baseUrl);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to send device info');
    }
  }
}
