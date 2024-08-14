import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tictoc_clone_app/authentication/login_screen.dart';
import 'package:tictoc_clone_app/authentication/registration_screen.dart';
import 'package:tictoc_clone_app/home/home_screen.dart';
import 'package:tictoc_clone_app/widgets/gloabl.dart';
import 'user.dart' as userModel;

class AuthenticationController extends GetxController {
  static AuthenticationController instanceAuth = Get.find();
  late Rx<File?> _pickedFile;
  File? get profileImage => _pickedFile.value;
  late Rx<User?> _currentUser;
  void chooseImageFromGallary() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImageFile != null) {
      Get.snackbar(
          'Profile Image', 'You have successfully selected your profile Image');
    }
    _pickedFile = Rx<File?>(File(pickedImageFile!.path));
  }

  void captureImageWithCamera() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImageFile != null) {
      Get.snackbar(
          'Profile Image', 'You have successfully capture your profile Image');
    }
    _pickedFile = Rx<File?>(File(pickedImageFile!.path));
  }

  void createAccountForNewUser(File imageFile, String userName,
      String userEmail, String userPassword) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
//save the user profile image to firebase storage
      String imageDownloadUrl = await uploadImageToStorage(imageFile);
//SAve data to firestore database
      userModel.User user = userModel.User(
        name: userName,
        email: userEmail,
        image: imageDownloadUrl,
        uid: credential.user!.uid,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set(user.toJson());

      Get.snackbar(
        'Account Created',
        'Successfuly Your account created',
        backgroundColor: Colors.green,
      );
      showProgessBar = false;
    } catch (e) {
      Get.snackbar(
        'Account Creation unsuccessful',
        e.toString(),
        backgroundColor: Colors.green,
      );
      showProgessBar = false;
      Get.to(LoginScreen());
    }
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('Profile Images')
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = reference.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;

    String downloadUrlOfUploadImage = await taskSnapshot.ref.getDownloadURL();
    return downloadUrlOfUploadImage;
  }

  void loginUserNow(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Login Successful', 'Successful Logined To Your Account',
          backgroundColor: Colors.green);
      showProgessBar = false;
    } catch (e) {
      Get.snackbar('Login Unsuccessful', e.toString(),
          backgroundColor: Colors.red);
      showProgessBar = false;
      Get.to(RegistrationScreen());
    }
  }

  checkUserGotoScreen(User? currentUser) {
    if (currentUser == null) {
      Get.offAll(LoginScreen());
    } else {
      Get.offAll(HomeScreen());
    }
  }

  @override
  void onReady() {
    super.onReady();
    _currentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    _currentUser.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_currentUser, checkUserGotoScreen);
  }
}
