import 'package:dealsdray/models/otp_verify_model.dart';
import 'package:dealsdray/presentation/screens/home_page.dart';
import 'package:dealsdray/presentation/screens/signup_page.dart';
import 'package:dealsdray/servives/otp_verify_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OtpVerificationPage extends StatefulWidget {
  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  Timer? _timer;
  int _start = 120;
  bool _isLoading = true;
  bool _isVerifying = false;

  final OtpVerificationService _otpService = OtpVerificationService();

  @override
  void initState() {
    super.initState();
    startTimer();
    _startLoading();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer?.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  Future<void> _startLoading() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  Future<void> _verifyOtp() async {
    final String otp =
        _otpControllers.map((controller) => controller.text).join();

    if (otp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter the OTP')),
      );
      return;
    }

    setState(() {
      _isVerifying = true;
    });

    final request = OtpVerificationRequest(
      otp: otp,
      deviceId: "62b43472c84bb6dac82e0504",
      userId: "62b43547c84bb6dac82e0525",
    );

    bool isVerified = await _otpService.verifyOtp(request);

    setState(() {
      _isVerifying = false;
    });

    if (isVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP Verified Successfully!')),
      );
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP. Please try again.')),
      );
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignUp()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? const SpinKitCircle(
                size: 100, color: Color.fromARGB(255, 255, 0, 0))
            : _isVerifying
                ? const SpinKitCircle(
                    size: 100, color: Color.fromARGB(255, 255, 0, 0))
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/otp.png")),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "OTP VERIFICATION",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "We have sent you a unique otp number",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              "to your mobile +91 9011470243",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 60),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(4, (index) {
                                return SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: TextField(
                                    controller: _otpControllers[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      counterText: '',
                                    ),
                                    onChanged: (value) {
                                      if (value.length == 1 && index < 3) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 2),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "00:${_start < 10 ? '0$_start' : _start}",
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.red),
                                  ),
                                  TextButton(
                                    onPressed: _start == 0
                                        ? () {
                                            setState(() {
                                              _start = 120;
                                              startTimer();
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      'Resend Code',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: _start == 0
                                            ? const Color.fromARGB(
                                                255, 243, 33, 33)
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: _verifyOtp,
                              child: const Text(
                                'Verify OTP',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
