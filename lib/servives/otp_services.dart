import 'dart:convert';
import 'package:dealsdray/models/otp_request_model.dart';
import 'package:http/http.dart' as http;

class OtpService {
  final String _baseUrl = 'http://devapiv4.dealsdray.com/api/v2/user/otp';

  Future<bool> sendOtp(OtpRequest otpRequest) async {
    final url = Uri.parse(_baseUrl);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(otpRequest.toJson()),
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed response: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error sending OTP: $e');
      return false;
    }
  }
}
