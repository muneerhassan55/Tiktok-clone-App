import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictoc_clone_app/home/home_screen.dart';
import 'package:tictoc_clone_app/home/upload_video/video.dart';
import 'package:tictoc_clone_app/widgets/gloabl.dart';
import 'package:video_compress/video_compress.dart';

class UploadController extends GetxController {
  compressVideoFile(String videoFilePath) async {
    final compressVideoFile = await VideoCompress.compressVideo(videoFilePath,
        quality: VideoQuality.LowQuality);
    return compressVideoFile!.file;
  }

  uploadCompressVideoFileToFirebaseStorage(
      String videoId, String videoFilePath) async {
    UploadTask videoUploadTask = FirebaseStorage.instance
        .ref()
        .child('All Videos')
        .child(videoId)
        .putFile(await compressVideoFile(videoFilePath));
    TaskSnapshot snapshot = await videoUploadTask;
    String downloadUrlOfUploadVideo = await snapshot.ref.getDownloadURL();
    return downloadUrlOfUploadVideo;
  }

  getThumbnailImage(String videoFilePath) async {
    final thumbnailImage = await VideoCompress.getFileThumbnail(videoFilePath);
    return thumbnailImage;
  }

  uploadThumNailImageFirebaseStorage(
      String videoId, String videoFilePath) async {
    UploadTask thumbnailUploadTask = FirebaseStorage.instance
        .ref()
        .child('All Thumbnails')
        .child(videoId)
        .putFile(await getThumbnailImage(videoFilePath));
    TaskSnapshot snapshot = await thumbnailUploadTask;
    String downloadUrlOfUploadVideo = await snapshot.ref.getDownloadURL();
    return downloadUrlOfUploadVideo;
  }

  saveVideoToFirebaseStorage(String artistName, String despTags,
      String videoFilePath, BuildContext context) async {
    try {
      DocumentSnapshot userDocumentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      String videoId = DateTime.now().microsecondsSinceEpoch.toString();
      String videoDownloadUrl = await uploadCompressVideoFileToFirebaseStorage(
          videoId, videoFilePath);

      String thumbnailDownloadUrl =
          await uploadCompressVideoFileToFirebaseStorage(
              videoId, videoFilePath);

      Video videoObject = Video(
        userID: FirebaseAuth.instance.currentUser!.uid,
        userName: (userDocumentSnapshot.data() as Map<String, dynamic>)['name'],
        userProfileImage:
            (userDocumentSnapshot.data() as Map<String, dynamic>)['image'],
        videoID: videoId,
        totalComments: 0,
        totalShares: 0,
        likeList: [],
        artistSongName: artistName,
        despTags: despTags,
        videoUrl: videoDownloadUrl,
        thumbnailUrl: thumbnailDownloadUrl,
        publishedDateTime: DateTime.now().microsecondsSinceEpoch,
      );
      showProgessBar = false;

      await FirebaseFirestore.instance
          .collection('Videos')
          .doc(videoId)
          .set(videoObject.toJson());
      Get.to(HomeScreen());
      Get.snackbar('Successful', 'Video Successfully Uploaded');
    } catch (e) {
      Get.snackbar('Video Upload Unsuccessful', e.toString());
    }
  }
}
