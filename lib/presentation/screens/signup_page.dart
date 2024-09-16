

import 'package:dealsdray/models/signup_model.dart';
import 'package:dealsdray/presentation/screens/home_page.dart';
import 'package:dealsdray/servives/signup_service.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();
  SignupService signupService=SignupService();

void _signupUser() async {
  try {
    final model = SignupModel(
      email: _emailController.text,
      password: _passwordController.text,
      referralCode: _referralCodeController.text.isEmpty ? null : _referralCodeController.text,
      userId: "62a833766ec5dafd6780fc85", 
    );

    final result = await signupService.signupUser(model);

    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup successful')),
      );
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
      const   SnackBar(content: Text('Signup failed')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 200,
                width: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"))),
              ),
            ),
          const   Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                                  "Let's Begin !",
                                  style: TextStyle(color: Colors.black, fontSize: 30),
                                ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
             const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Please Enter Your Credential To Proceed.",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )
                    ],
                  ),
                ),const SizedBox(height: 20,),
            
            
           
            _textfielddata("Your Email", controller: _emailController),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                obscureText: true,
                decoration:const  InputDecoration(
                  labelText: "Create Password",
                  labelStyle: TextStyle(color: Colors.black),
                  contentPadding: EdgeInsets.only(bottom: 8),
                  suffixIcon: Icon(Icons.remove_red_eye, size: 20),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 30, 31, 31), width: 2),
                  ),
                ),
                controller: _passwordController,
              ),
            ),
            const SizedBox(height: 20),
            _textfielddata("Referral Code (optional)", controller: _referralCodeController),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward, color: Colors.white),
                      onPressed: _signupUser,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textfielddata(String labeltext, {TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: const TextStyle(color: Colors.black),
          contentPadding: const EdgeInsets.only(bottom: 8),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 33, 33, 34), width: 2),
          ),
        ),
      ),
    );
  }
}
