import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tictoc_clone_app/home/upload_video/upload_controller.dart';
import 'package:tictoc_clone_app/widgets/gloabl.dart';
import 'package:video_player/video_player.dart';

import '../../widgets/text_input_widget.dart';

class UploadFormScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;

  const UploadFormScreen({required this.videoFile, required this.videoPath});

  @override
  State<UploadFormScreen> createState() => _UploadFormScreenState();
}

class _UploadFormScreenState extends State<UploadFormScreen> {
  UploadController uploadController = Get.put(UploadController());
  VideoPlayerController? playerController;
  TextEditingController artisttextEditingController = TextEditingController();
  TextEditingController descptextEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      playerController = VideoPlayerController.file(widget.videoFile);
    });
    playerController!.initialize();
    playerController!.play();
    playerController!.setVolume(2);
    playerController!.setLooping(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    playerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 1.3,
              width: MediaQuery.sizeOf(context).width,
              child: VideoPlayer(playerController!),
            ),
            SizedBox(
              height: Get.height / 40,
            ),
            showProgessBar == true
                ? Container(
                    child: SimpleCircularProgressBar(
                      progressColors: [
                        Colors.green,
                        Colors.blueAccent,
                        Colors.red,
                        Colors.amber,
                        Colors.pinkAccent
                      ],
                      animationDuration: 10,
                      backColor: Colors.white38,
                    ),
                  )
                : Column(
                    children: [
                      TextInputWidget(
                          textEditingController: artisttextEditingController,
                          labelString: 'Artist Song',
                          iconData: Icons.music_video_sharp,
                          isObsecure: true),
                      TextInputWidget(
                          textEditingController: descptextEditingController,
                          labelString: 'Description Tags',
                          iconData: Icons.slideshow_sharp,
                          isObsecure: true),
                    ],
                  ),
            SizedBox(
              height: Get.height / 80,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width - 38,
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  if (artisttextEditingController.text.isNotEmpty &&
                      descptextEditingController.text.isNotEmpty) {
                    uploadController.saveVideoToFirebaseStorage(
                        artisttextEditingController.text,
                        descptextEditingController.text,
                        widget.videoPath,
                        context);
                  }
                  setState(() {
                    showProgessBar = true;
                  });
                },
                child: Center(
                  child: Text(
                    'Upload Now',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
