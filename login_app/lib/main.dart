import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blur/blur.dart';
import 'package:login_app/components/bubble.dart';

void main() {
  runApp(MaterialApp(home: AuthPage()));
}

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIn = true; // Flag to toggle between sign-in and sign-up

  // Controllers for form inputs
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0D0D2B),
                  Color(0xFF1A1A3D),
                ],
              ),
            ),
          ),
          // Bubble Gradient Effect
          Positioned(
            top: 50,
            left: -100,
            child: BubbleCircle(
              size: 300,
              colors: [
                Colors.purpleAccent.withOpacity(0.4),
                Colors.blueAccent.withOpacity(0.2),
              ],
            ),
          ),
          Positioned(
            bottom: -150,
            right: -100,
            child: BubbleCircle(
              size: 350,
              colors: [
                Colors.pinkAccent.withOpacity(0.4),
                Colors.orangeAccent.withOpacity(0.3),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            left: -100,
            child: BubbleCircle(
              size: 250,
              colors: [
                Colors.blue.withOpacity(0.4),
                Colors.cyanAccent.withOpacity(0.3),
              ],
            ),
          ),
          // Blur effect over the bubbles
          Positioned.fill(
            child: Blur(
              blur: 20.0,
              blurColor: Colors.black.withOpacity(0.2),
              child: Container(),
            ),
          ),
          // Sign-In/Sign-Up Form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    height: 100,
                    child: Image.asset('assets/logo.png'),
                  ),
                  SizedBox(height: 20),
                  //Sign In Text
                  isSignIn
                      ? Text(
                          'Sign In',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        )
                      : Text(
                          'Sign Up',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                  SizedBox(height: 40),

                  isSignIn ? _buildSignInForm() : _buildSignUpForm(),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignIn =
                            !isSignIn; // Toggle between Sign-In and Sign-Up
                      });
                    },
                    child: Text(
                      isSignIn
                          ? "Don't have an account? Sign up"
                          : "Already have an account? Sign in",
                      style: GoogleFonts.roboto(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Sign-In Form
  Widget _buildSignInForm() {
    return Column(
      children: [
        // Email Input
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'E-Mail',
            labelStyle: GoogleFonts.roboto(color: Colors.white70),
            filled: true,
            fillColor: Colors.black.withOpacity(0.3),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 20),
        // Password Input
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: GoogleFonts.roboto(color: Colors.white70),
            filled: true,
            fillColor: Colors.black.withOpacity(0.3),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 20),
        // Sign in Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              backgroundColor: Colors.black.withOpacity(0.7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              // Add your sign-in logic here
              print("Email: ${emailController.text}");
              print("Password: ${passwordController.text}");
            },
            child: Text(
              'Sign in',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Sign-Up Form
  Widget _buildSignUpForm() {
    return Column(
      children: [
        // Email Input
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'E-Mail',
            labelStyle: GoogleFonts.roboto(color: Colors.white70),
            filled: true,
            fillColor: Colors.black.withOpacity(0.3),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 20),
        // Password Input
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: GoogleFonts.roboto(color: Colors.white70),
            filled: true,
            fillColor: Colors.black.withOpacity(0.3),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 20),
        // Confirm Password Input
        TextField(
          controller: confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            labelStyle: GoogleFonts.roboto(color: Colors.white70),
            filled: true,
            fillColor: Colors.black.withOpacity(0.3),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 20),
        // Sign up Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              backgroundColor: Colors.black.withOpacity(0.7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              // Add your sign-up logic here
              if (passwordController.text == confirmPasswordController.text) {
                print("Sign-Up Successful");
                print("Email: ${emailController.text}");
                print("Password: ${passwordController.text}");
              } else {
                print("Passwords do not match");
              }
            },
            child: Text(
              'Sign up',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
