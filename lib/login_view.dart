import 'package:flutter/material.dart';
import 'package:hungry_bite/common/color_extension.dart';
import 'package:hungry_bite/common_widget/round_textfield.dart';
import 'package:hungry_bite/services/auth_services.dart';
import 'package:hungry_bite/signup_view.dart';

import 'home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthService _authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: "Schuyler",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Add your details to login",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: TColor.secondaryText,
                  ),
                ),

                const SizedBox(height: 30),

                RoundTextfield(
                  hintText: "Your Email",
                  controller: emailController,
                ),

                const SizedBox(height: 30),

                RoundTextfield(
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: true,
                ),

                const SizedBox(height: 40),

                // Login Button
                GestureDetector(
                  onTap: () async {
                    try {
                      final user = await _authService.login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      if (user != null) {

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
                      "Login",
                      style: TextStyle(
                        color: TColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                GestureDetector(
                  onTap: () {},
                  child: const Text("Forgot your password?"),
                ),

                const SizedBox(height: 36),

                Text(
                  "or Login With",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: TColor.secondaryText,
                  ),
                ),

                const SizedBox(height: 20),

                // Facebook login
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/facebook_logo.png",
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Login with Facebook",
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 26),

                // Google login
                GestureDetector(
                  onTap: () async {
                    try {
                      final user = await _authService.signInWithGoogle();

                      if (user != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Google login successful")),
                        );

                        // Navigate to Home
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeView()),);// Navigator.pushReplacement(...)
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  },
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google_logo.png",
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          "Login with Google",
                          style: TextStyle(
                            color: TColor.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 200),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupView(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
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
      ),
    );
  }
}
