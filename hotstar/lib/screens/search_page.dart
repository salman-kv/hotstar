import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotstar/api/calling_api.dart'; 

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
   SearchPage({super.key});
  Timer? _debouncer;

  @override
  Widget build(BuildContext context) {
    searchEmpty();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 45,
            child: SearchBar(
              onChanged: (value) {
                if (value.isEmpty) {
                  searchEmpty();
                } else {
                  if(_debouncer?.isActive ?? false){
                    _debouncer?.cancel();
                  }
                  _debouncer=Timer(const Duration(milliseconds: 500), () {
                     serchingApi(value);
                  });
                }
              },
              textStyle: MaterialStatePropertyAll(Theme.of(context).textTheme.displaySmall),
              leading: const Icon(Icons.search),
              hintText: 'Movies,shows and more',
              hintStyle: MaterialStatePropertyAll(Theme.of(context).textTheme.displaySmall),
              trailing: const [Icon(Icons.mic_none_outlined)],
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: searchListener,
          builder: (context, valu, _) {
            return valu.isEmpty
                ? const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          color: Colors.white,
                          size: 40,
                        ),
                        Text(
                          'No Data Found',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: List.generate(valu.length, (index) {
                          if (valu[index]["backdrop_path"] != null) {
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
                                                  'https://image.tmdb.org/t/p/w500/${valu[index]["backdrop_path"]}'),
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
                                              valu[index]['title'],
                                              style: Theme.of(context).textTheme.bodyMedium
                                            ),
                                            Text(
                                              'Language : ${valu[index]['original_language']}',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              'Release Date : ${valu[index]['release_date']}',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              'Rating : ${valu[index]['vote_average']}',
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
                  );
          },
        )
        // ListView(
        //   shrinkWrap: true,
        //   physics: ScrollPhysics(),
        //   children: List.generate(100, (index) => Text('fsd',style: TextStyle(color: Colors.amber),)),
        // )
      ],
    );
  }
}
