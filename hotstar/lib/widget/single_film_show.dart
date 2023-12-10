import 'package:flutter/material.dart';
import 'package:hotstar/api/calling_api.dart';
import 'package:hotstar/widget/videopage.dart';

class SingleFilmShow extends StatelessWidget {
  final dynamic mainList;
  const SingleFilmShow({super.key, required this.mainList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(
              minHeight: 600,
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500/${mainList["poster_path"]}'),
                      fit: BoxFit.fill)),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 40),
                        maximumSize: const Size(100, 40),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255)),
                    onPressed: () async {
                      final res = await getYoutube(mainList['id']);
                      if (res == null) {
                        return;
                      } else {
                        // ignore: use_build_context_synchronously
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return BeShow(
                            fechVideoId: res,
                            mainList: mainList,
                          );
                        }));
                      }
                    },
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Watch',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              mainList['title'],
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              mainList['original_title'],
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: const Color.fromARGB(255, 151, 151, 151)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              'language  :  ${mainList['original_language']}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: const Color.fromARGB(255, 151, 151, 151)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              'rating  :  ${mainList['vote_average']}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: const Color.fromARGB(255, 151, 151, 151)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              ' " ${mainList['overview']} "',
              strutStyle: const StrutStyle(
                height: 2,
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
