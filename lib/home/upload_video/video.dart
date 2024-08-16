import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String? userID;
  String? userName;
  String? userProfileImage;
  String? videoID;
  int? totalComments;
  int? totalShares;
  List? likeList;
  String? artistSongName;
  String? despTags;
  String? videoUrl;
  String? thumbnailUrl;
  int? publishedDateTime;

  Video(
      {this.userID,
      this.userName,
      this.userProfileImage,
      this.videoID,
      this.totalComments,
      this.totalShares,
      this.likeList,
      this.artistSongName,
      this.despTags,
      this.videoUrl,
      this.thumbnailUrl,
      this.publishedDateTime});
  Map<String, dynamic> toJson() => {
        'userID': userID,
        'userName': userName,
        'videoID': videoID,
        'userProfileImage': userProfileImage,
        'totalComments': totalComments,
        'totalShares': totalShares,
        'likeList': likeList,
        'artistSongName': artistSongName,
        'despTags': despTags,
        'videoUrl': videoUrl,
        'thumbnailUrl': thumbnailUrl,
        'publishedDateTime': publishedDateTime,
      };

  static Video fromDocumentSnapShot(DocumentSnapshot snapshot) {
    var docSnapShot = snapshot.data() as Map<String, dynamic>;
    return Video(
      userID: docSnapShot['userID'],
      userName: docSnapShot['userName'],
      userProfileImage: docSnapShot['userProfileImage'],
      videoID: docSnapShot['videoID'],
      totalComments: docSnapShot['totalComments'],
      totalShares: docSnapShot['totalShares'],
      likeList: docSnapShot['likeList'],
      artistSongName: docSnapShot['artistSongName'],
      despTags: docSnapShot['despTags'],
      videoUrl: docSnapShot['videoUrl'],
      thumbnailUrl: docSnapShot['thumbnailUrl'],
      publishedDateTime: docSnapShot['publishedDateTime'],
    );
  }
}
