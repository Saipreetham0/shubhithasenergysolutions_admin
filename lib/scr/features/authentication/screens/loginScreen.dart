import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions_admin/scr/config/responsive.dart';
import 'package:shubhithasenergysolutions_admin/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/authentication/screens/widget/company_logo_widget.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/Dashboard.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/Dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    // categoryController.dispose();
    super.dispose();
  }

  bool passwordObscureText = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: isDark
            ? Theme.of(context).scaffoldBackgroundColor
            : (Responsive.isDesktop(context))
                ? Colors.grey[200]
                : Colors.white,
        // appBar: AppBar(
        //   title: const Text('Login Screen'),
        // ),
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.blue[100],
                  decoration: BoxDecoration(
                    color: isDark ? Theme.of(context).cardColor : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  height: size.height,
                  margin: EdgeInsets.symmetric(
                      horizontal: size.height * 0.032,
                      vertical: size.height * 0.12),
                  // color: Color(0xffF6F6F6),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height * 0.01),
                        const companyLogoWidget(),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          'Please login to your account',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(height: size.height * 0.02),
                        const SizedBox(height: 6.0),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            labelText: "Email",
                            hintText: "Enter your email",

                            // border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: size.height * 0.014),
                        const SizedBox(height: 6.0),
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: passwordObscureText,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.fingerprint),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            // border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordObscureText = !passwordObscureText;
                                });
                              },
                              icon: Icon(
                                passwordObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text('Forgot Password?',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ),
                        SizedBox(height: size.height * 0.05),
                        SizedBox(
                            height: size.height * 0.08,
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  _signIn();
                                },
                                child: Text(
                                  'Sign In'.toUpperCase(),
                                  style: isDark
                                      ? Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)
                                      : Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                ))),
                      ],
                    ),
                  ),
                ),
              ),
              if (Responsive.isDesktop(context))
                Expanded(
                    flex: 1,
                    child: Container(
                        // color: Colors.blue,
                        ))
            ],
          ),
        ));
  }

  void _signIn() async {
    AuthController.instance
        .login(_emailController.text.trim(), _passwordController.text.trim());
  }
}
