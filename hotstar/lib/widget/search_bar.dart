import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotstar/api/calling_api.dart';

// ignore: must_be_immutable
class SearchBarOnly extends StatelessWidget {
  SearchBarOnly({super.key});
  Timer? _debouncer;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
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
            );
  }
}