import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MateriTutorial extends StatefulWidget {
  final String id;
  final String nameContent;
  final String video;
  final String deskripsi;
  MateriTutorial({
    super.key,
    required this.id,
    required this.nameContent,
    required this.video,
    required this.deskripsi,
  });

  @override
  _MateriTutorialState createState() => _MateriTutorialState();
}

class _MateriTutorialState extends State<MateriTutorial> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  int contentIndex = 0;
  var courseData;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://codinggo.my.id/uploaded_files/${widget.video}',
    );
    _initializeVideoPlayerFuture = _controller.initialize().catchError((error) {
      print("Error initializing video player: $error");
    });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Flexible(
          child: Row(
            children: [
              Text(
                widget.nameContent,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (_controller.value.isInitialized) {
                return Column(
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    const SizedBox(height: 20),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      },
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              contentIndex = 0;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: contentIndex == 0
                                ? Color.fromARGB(255, 255, 127, 63)
                                : Color.fromARGB(255, 53, 109, 192),
                          ),
                          child: const Text(
                            "Deskripsi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: Offset(0, 0),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Deskripsi",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.deskripsi,
                            style: TextStyle(fontSize: 16),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: Text("Video tidak bisa diputar"));
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
