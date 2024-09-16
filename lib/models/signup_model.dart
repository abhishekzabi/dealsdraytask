// models/signup_model.dart

class SignupModel {
  final String email;
  final String password;
  final String? referralCode; 
  final String userId;

  SignupModel({
    required this.email,
    required this.password,
    this.referralCode, 
    required this.userId,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      email: json['email'],
      password: json['password'],
      referralCode: json['referralCode'], 
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'referralCode': referralCode, 
      'userId': userId,
    };
  }
}
