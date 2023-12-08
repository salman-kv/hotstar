import 'package:flutter/material.dart';

List<dynamic> latest=[];
List<dynamic> trending=[];
List<dynamic> mainmovie=[];
List<dynamic> tvShow=[];
ValueNotifier<List<dynamic>> searchListener=ValueNotifier([]); 


convertApiOutputToList(Map<String, dynamic> apiData ,List<dynamic> list ) async {
  list.clear();
  // list=apiData['results'];
  list.addAll(apiData['results']);
  // List<dynamic>val=apiData['results'];
  // print(val);
  // for(int i=0;i<val.length;i++){
  //   list.add(val[i]);
  // }
}

SearchEmpty(){
  searchListener.value.clear();
  searchListener.value.addAll(mainmovie);
  searchListener.notifyListeners();
}


