import 'package:dealsdray/models/otp_verify_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class OtpVerificationService {
  static const String _baseUrl = "http://devapiv4.dealsdray.com/api/v2/user/otp/verification";

  Future<bool> verifyOtp(OtpVerificationRequest request) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200  || response.statusCode==502) {
     
        return true;
      } else {
     
        final responseBody = jsonDecode(response.body);
        print("Error: ${responseBody['message']}");
        return false;
      }
    } catch (e) {
    
      print("Exception: $e");
      return false;
    }
  }
}
