// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tictoc_clone_app/authentication/authentication_controller.dart';
import 'package:tictoc_clone_app/authentication/login_screen.dart';

import '../widgets/gloabl.dart';
import '../widgets/text_input_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController userNmaeTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  final authenticationController = Get.put(AuthenticationController());

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
              Text(
                'Create Account',
                style: GoogleFonts.acme(
                    fontSize: 34,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'to  get Startedd Now!',
                style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              authenticationController.chooseImageFromGallary();
                              Navigator.of(context)
                                  .pop(); // Close the dialog after selection
                            },
                            child: Column(
                              children: [Icon(Icons.image), Text('Gallery')],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              authenticationController.captureImageWithCamera();
                              Navigator.of(context)
                                  .pop(); // Close the dialog after selection
                            },
                            child: Column(
                              children: [Icon(Icons.camera), Text('Camera')],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/profile_avatar.png'),
                  backgroundColor: Colors.black,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextInputWidget(
                  textEditingController: userNmaeTextEditingController,
                  labelString: 'Username',
                  iconData: Icons.person_outline,
                  isObsecure: false),
              SizedBox(
                height: 25,
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
                              setState(() {
                                showProgessBar = true;
                              });
                              if (authenticationController
                                          .profileImage !=
                                      null &&
                                  userNmaeTextEditingController
                                      .text.isNotEmpty &&
                                  emailTextEditingController.text.isNotEmpty &&
                                  passwordTextEditingController
                                      .text.isNotEmpty) {
                                authenticationController
                                    .createAccountForNewUser(
                                        authenticationController.profileImage!,
                                        userNmaeTextEditingController.text,
                                        emailTextEditingController.text,
                                        passwordTextEditingController.text);
                              }
                            },
                            child: Center(
                              child: Text(
                                'Sign Up',
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
                              "Already have an account? ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => LoginScreen());
                              },
                              child: Text('Login',
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
