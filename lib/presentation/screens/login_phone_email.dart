import 'package:dealsdray/models/otp_request_model.dart';
import 'package:dealsdray/presentation/screens/allscreens.dart';
import 'package:dealsdray/presentation/screens/otp_verification_page.dart';
import 'package:dealsdray/servives/otp_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                "Tap to Icon to See all screens",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AllScreens()));
                  },
                  child: Text("Tap Me"))
              // Icon(Icons.remove_red_eye,size: 22,color: Colors.red,)
            ],
          ),
        ),
        body: LoginSignupPage(),
      ),
    );
  }
}

class LoginSignupPage extends StatefulWidget {
  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  bool isLoginPage = true;
  final phoneController = TextEditingController();
  final otpService = OtpService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 200,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png")),
                ),
              ),
            ),
            Container(
              width: 160,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[300],
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    alignment: isLoginPage
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromRGBO(237, 32, 39, 1)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoginPage = true;
                            });
                          },
                          child: Center(
                            child: Text(
                              'Phone',
                              style: TextStyle(
                                fontSize: 18,
                                color:
                                    isLoginPage ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoginPage = false;
                            });
                          },
                          child: Center(
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 18,
                                color:
                                    isLoginPage ? Colors.black : Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            isLoginPage ? buildLoginPage() : buildSignupPage(),
          ],
        ),
      ),
    );
  }

  Widget buildLoginPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Glad to see you!",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Please provide your phone number ",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextField(
            controller: phoneController,
            keyboardType: TextInputType.number, // Sets keyboard to number pad
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // Allows only digits
              LengthLimitingTextInputFormatter(
                  10), // Limits length to 10 digits
            ],
            decoration: const InputDecoration(
              labelText: "Phone",
              labelStyle: TextStyle(color: Colors.black),
              contentPadding: EdgeInsets.only(bottom: 28),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 30, 31, 31), width: 2),
              ),
            ),
          ),
          const SizedBox(height: 35),
          Center(
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(237, 32, 39, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _sendOtp,
                child: const Text(
                  'SEND CODE',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSignupPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Glad to see you!",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Please provide your phone number ",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.black),
              contentPadding: EdgeInsets.only(bottom: 28),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 30, 31, 31), width: 2),
              ),
            ),
          ),
          const SizedBox(height: 35),
          Center(
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(237, 32, 39, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Handle signup action
                },
                child: const Text(
                  'SEND CODE',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendOtp() async {
    final mobileNumber = phoneController.text.trim(); // Get user input
    final deviceId = "62b341aeb0ab5ebe28a758a3"; // Device ID

    if (mobileNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a phone number')),
      );
      return;
    }

    final otpRequest = OtpRequest(
      mobileNumber: mobileNumber,
      deviceId: deviceId,
    );

    final success = await otpService.sendOtp(otpRequest);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP sent successfully')),
      );
      CircularProgressIndicator();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => OtpVerificationPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send OTP. Please try again.')),
      );
    }
  }
}
