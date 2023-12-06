import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hotstar/home/main_page.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   late VideoPlayerController _videoPlayerController;
    late Future<void> _initializeVideoPlayerFuture;

    @override
      initState() {
      // _videoPlayerController=VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
      _videoPlayerController=VideoPlayerController.asset("assets/video/hoststarPhone.mp4");
      _initializeVideoPlayerFuture=_videoPlayerController.initialize().then((value){
        _videoPlayerController.play();
        _videoPlayerController.setVolume(0);
        _videoPlayerController.setLooping(true);
        setState(() {
          
        });
      });
      Timer(const Duration(milliseconds:3000), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
          return  MainPage();
        }));
       });
      super.initState();
    }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _initializeVideoPlayerFuture, builder: ((context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: VideoPlayer(_videoPlayerController),
        );
        // return AspectRatio(aspectRatio: _videoPlayerController.value.aspectRatio,
        // child: VideoPlayer(_videoPlayerController),
        // );
      }
      else{
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }));
  }
}





// import 'package:flutter/material.dart';
// import 'package:appinio_video_player/appinio_video_player.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   late CustomVideoPlayerController _controller;
//   //  Future<void>? _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     // _controller=VideoPlayerController.asset('assets/opening video.mp4');
//     // _initializeVideoPlayerFuture=_controller.initialize();
//     // _controller.setLooping(true);
//     setState(() {});
//     initializeVideoPlayer();
//     super.initState();

//   }

//   void initializeVideoPlayer() {
//     VideoPlayerController _videoPlayerController;
//     _videoPlayerController =
//         VideoPlayerController.asset("assets/video/opening video.mp4")
//           ..initialize().then((value) {
//             setState(() {
              
//             });
//           });
//     _controller = CustomVideoPlayerController(
//         context: context, videoPlayerController: _videoPlayerController);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Column(
//         children: [
//           CustomVideoPlayer(customVideoPlayerController: _controller),
//           // FutureBuilder(
//           //     future: _initializeVideoPlayerFuture,
//           //     builder: (ctx, snapshot) {
//           //       if (snapshot.connectionState == ConnectionState.done) {
//           //         return SizedBox(
//           //           height: 500,
//           //           width: 500,
//           //           child: VideoPlayer(_controller),
//           //         );
//           //       } else {
//           //         return CircularProgressIndicator();
//           //       }
//           //     }),
//           ElevatedButton(
//               onPressed: () {
//                 // _controller.play();
//                 setState(() {});
//               },
//               child: const Text('halo')),
//         ],
//       )),
//     );
//   }
// }
