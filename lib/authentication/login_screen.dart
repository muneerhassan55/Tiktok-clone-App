// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tictoc_clone_app/authentication/authentication_controller.dart';
import 'package:tictoc_clone_app/authentication/registration_screen.dart';
import 'package:tictoc_clone_app/widgets/text_input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgessBar = false;
  var authenticationController = AuthenticationController.instanceAuth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset(
                "assets/tiktok.png",
                width: 200,
              ),
              Text(
                'Welcome',
                style: GoogleFonts.acme(
                    fontSize: 34,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Glad to see you!',
                style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextInputWidget(
                  textEditingController: emailTextEditingController,
                  labelString: 'Email',
                  iconData: Icons.email_outlined,
                  isObsecure: false),
              SizedBox(
                height: 25,
              ),
              TextInputWidget(
                  textEditingController: passwordTextEditingController,
                  labelString: 'Password',
                  iconData: Icons.lock_outline,
                  isObsecure: true),
              SizedBox(
                height: 30,
              ),
              showProgessBar == false
                  ? Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width - 38,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (emailTextEditingController.text.isNotEmpty &&
                                  passwordTextEditingController
                                      .text.isNotEmpty) {
                                setState(() {
                                  showProgessBar = true;
                                });
                                authenticationController.loginUserNow(
                                    emailTextEditingController.text,
                                    passwordTextEditingController.text);
                              }
                            },
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => RegistrationScreen());
                              },
                              child: Text('SignUp',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )
                      ],
                    )
                  : Container(
                      child: SimpleCircularProgressBar(
                        progressColors: [
                          Colors.green,
                          Colors.blueAccent,
                          Colors.red,
                          Colors.amber,
                          Colors.pinkAccent
                        ],
                        animationDuration: 3,
                        backColor: Colors.white38,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
