// services/signup_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/signup_model.dart';

class SignupService {
  static const String _baseUrl = 'http://devapiv4.dealsdray.com/api/v2/user/email/referral';

  Future<bool> signupUser(SignupModel model) async {
    final url = Uri.parse(_baseUrl);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(model.toJson()),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {
      return true;
    } else {
      throw Exception('Failed to signup: Status code ${response.statusCode}. Response: ${response.body}');
    }
  }
}
