import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class User {
  String? name;
  String? uid;
  String? image;
  String? email;
  String? youtube;
  String? facebook;
  String? twiter;
  String? instagram;
  User(
      {this.name,
      this.uid,
      this.image,
      this.email,
      this.youtube,
      this.facebook,
      this.twiter,
      this.instagram});
  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'image': image,
        'email': email,
        'youtube': youtube,
        'facebook': facebook,
        'twiter': twiter,
        'instagram': instagram,
      };
  static User fromSnap(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;
    return User(
      name: dataSnapshot['name'],
      uid: dataSnapshot['uid'],
      image: dataSnapshot['image'],
      email: dataSnapshot['email'],
      youtube: dataSnapshot['youtube'],
      facebook: dataSnapshot['facebook'],
      twiter: dataSnapshot['twiter'],
      instagram: dataSnapshot['instagram'],
    );
  }
}
