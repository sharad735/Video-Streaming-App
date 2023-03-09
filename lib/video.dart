import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_app/menu.dart';


class VideoPlayerScreen extends StatefulWidget {
  String videoUrl;

  VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Streaming App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Title: Butterfly movements captured",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 40,
          ),
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : CircularProgressIndicator(),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.blueAccent,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      VideoPlayerScreen(
                          videoUrl:
                              "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4");
                      
                    });
                  },
                  child: Icon(
                    Icons.skip_previous,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.blueAccent,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.blueAccent,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      VideoPlayerScreen(
                          videoUrl:
                              "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4");
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: Icon(
                    Icons.skip_next,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: MenuItems()),
            ],
          )
        ],
      ),
    );
  }
}

