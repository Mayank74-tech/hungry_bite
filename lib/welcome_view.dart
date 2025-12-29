import 'package:flutter/material.dart';
import 'package:hungry_bite/signup_view.dart';

import 'common/color_extension.dart';
import 'login_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: const Text(
                "Welcome Buddy!!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding
              (
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: (){
                  print("Login Button Pressed");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginView()));
                },
                child: Container(
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: TColor.primary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child:
                  Text("Login",
                  style: TextStyle(color: TColor.white,fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
                ),
              ),

            ),
            SizedBox(height: 20,),
            Padding(padding: const EdgeInsetsGeometry.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: (){
                  print("Create Account Button Pressed");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignupView()));
                  },
                child: Container(
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: TColor.primary),
                  ),
                  child: Text(
                    "Create an Account", style: TextStyle(
                    color: TColor.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),
                  ),

                ),
              ),
            )


          ],


        ),
      ),
    );
  }
}
