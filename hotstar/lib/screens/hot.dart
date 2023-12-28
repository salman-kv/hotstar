import 'package:flutter/material.dart';
import 'package:hotstar/api/calling_api.dart';

// ignore: must_be_immutable
class Hot extends StatelessWidget {
   Hot({super.key});

  @override
  Widget build(BuildContext context) {
    searchEmpty();
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Hot and New',style: Theme.of(context).textTheme.bodyMedium,),
        ),
        Expanded(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: List.generate(hot.length, (index) {
                          if (hot[index]["backdrop_path"] != null) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  // color: Colors.amber,s
                                  ),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          minHeight: 120,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500/${hot[index]["backdrop_path"]}'),
                                              fit: BoxFit.cover

                                              // image: AssetImage(
                                              //   'assets/image/photography.jpg',
                                              // ),
                                              // fit: BoxFit.cover,
                                              ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              hot[index]['title'],
                                              style: Theme.of(context).textTheme.bodyMedium
                                            ),
                                            Text(
                                              'Language : ${hot[index]['original_language']}',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              'Release Date : ${hot[index]['release_date']}',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              'Rating : ${hot[index]['vote_average']}',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        }),
                      ),
                    ),
                  )
        
      ],
    );
  }
}
