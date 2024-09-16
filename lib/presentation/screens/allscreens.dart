import 'package:dealsdray/presentation/screens/home_page.dart';
import 'package:dealsdray/presentation/screens/login_phone_email.dart';
import 'package:dealsdray/presentation/screens/otp_verification_page.dart';
import 'package:dealsdray/presentation/screens/signup_page.dart';
import 'package:flutter/material.dart';

class AllScreens extends StatefulWidget {
  const AllScreens({super.key});

  @override
  State<AllScreens> createState() => _AllScreensState();
}

class _AllScreensState extends State<AllScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
               ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));

              }, child: Text("login page")),
              const SizedBox(height: 15,),
               ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));

              }, child: Text("Signup page")),
              const SizedBox(height: 15,),
               ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OtpVerificationPage()));

              }, child: Text("otp verify page")),
              const SizedBox(height: 15,),
               ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));

              }, child: Text("Home Page")),
              const SizedBox(height: 15,),
            
          ],
        ),
      ),
    );
  }
}