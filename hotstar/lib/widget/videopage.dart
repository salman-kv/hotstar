import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BeShow extends StatefulWidget {
  final String fechVideoId;
  final mainList;
   const BeShow({super.key,required this.fechVideoId,required this.mainList});

  @override
  State<BeShow> createState() => _BeShowState(fechVideoId: fechVideoId,mainList: mainList);
}

class _BeShowState extends State<BeShow> {
  _BeShowState({required this.fechVideoId,required this.mainList});
  String? fechVideoId;
  final mainList;
  late final videoUrl;
  late YoutubePlayerController _controller;


  @override
  void initState() {
    videoUrl = 'https://www.youtube.com/watch?v=$fechVideoId';
    final vid = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
        initialVideoId: vid!, flags: YoutubePlayerFlags(autoPlay: true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            height: 350,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(mainList['title'],style: Theme.of(context).textTheme.bodyLarge,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
            child: Text(mainList['original_title'],style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color.fromARGB(255, 151, 151, 151)
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
            child: Text('language  :  ${mainList['original_language']}',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color.fromARGB(255, 151, 151, 151)
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
            child: Text('rating  :  ${mainList['vote_average']}',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color.fromARGB(255, 151, 151, 151) 
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
            child: Text(' " ${mainList['overview']} "',
            strutStyle: StrutStyle(
              height: 2,
              
            ),
            style: Theme.of(context).textTheme.bodyMedium,),
          ),

        ],
      ),
    );
  }
}
