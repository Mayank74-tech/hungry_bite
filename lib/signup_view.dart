import 'package:flutter/material.dart';
import 'package:hungry_bite/common_widget/round_textfield.dart';
import 'package:hungry_bite/services/auth_services.dart';

import 'common/color_extension.dart';
import 'login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  final AuthService _authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose()
  {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SafeArea(child:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                Text("SignUp",
                  style: TextStyle(fontSize: 35,fontFamily:"Schuyler",fontWeight:FontWeight.w800,),),
                const SizedBox(height: 8,),
                Text("Add your details to sign up",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: TColor.secondaryText,
                ),
                ),
                const SizedBox(height: 45,),
                RoundTextfield(controller: nameController,hintText: "Name",),
                const SizedBox(height: 35,),
                RoundTextfield(controller: emailController,hintText: "Email",),
                const SizedBox(height: 35,),
                RoundTextfield(controller: phoneController,hintText: "Phone",),
                const SizedBox(height: 35,),
                RoundTextfield(controller: addressController,hintText: "Address",),
                const SizedBox(height: 35,),
                RoundTextfield(hintText: "Password", controller: passwordController),
                const SizedBox(height: 35,),
                RoundTextfield(hintText: "Confirm Password", controller: confirmPasswordController),
                const SizedBox(height: 30,),

                GestureDetector(
                  onTap: () async {
                    try {
                      final user = await _authService.login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      if (user != null) {
                        print("Login Success");
                      }
                    } catch (e) {
                      print(e);
                    }
                  },


                  child: Container(
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: TColor.primary,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: TColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: TColor.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),


              ],
            ),
          ),
        ),
      )
      );

  }
}
