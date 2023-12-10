import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

List<dynamic> latest = [];
List<dynamic> trending = [];
List<dynamic> mainmovie = [];
List<dynamic> tvShow = [];
ValueNotifier<List<dynamic>> searchListener = ValueNotifier([]);

const baseUrl = 'https://api.themoviedb.org/3/';
const apikey = '?api_key=309101d3dc7e4c3c6b9970ea9fcfb5b0';
// https://api.themoviedb.org/3/trending/tv/day?api_key=309101d3dc7e4c3c6b9970ea9fcfb5b0
const searchUri =
    'https://api.themoviedb.org/3/search/movie?api_key=309101d3dc7e4c3c6b9970ea9fcfb5b0&query=';

getdata(String url, List<dynamic> list) async {
  Uri uri = Uri.parse("$baseUrl$url$apikey");
  final response = await http.get(uri);
  final data = response.body;
  final maindata = jsonDecode(data);
  await convertApiOutputToList(maindata, list);
  return true;
}

serchingApi(String searchString) async {
  searchListener.value.clear();
  Uri uri = Uri.parse("$searchUri$searchString");
  final response = await http.get(uri);
  final List<dynamic> data = jsonDecode(response.body)["results"];
  for (var element in data) {
    searchListener.value.add(element);
  }
  searchListener.notifyListeners();
}

getYoutube(int id) async {
  Uri uri = Uri.parse("$baseUrl/movie/$id/videos$apikey");
  final response = await http.get(uri);
  final List<dynamic> data = jsonDecode(response.body)['results'];

  if (data.isEmpty) {
    return null;
  } else {
    return data[0]['key'];
  }
}

convertApiOutputToList(Map<String, dynamic> apiData, List<dynamic> list) async {
  list.clear();
  // list=apiData['results'];
  list.addAll(apiData['results']);
  // List<dynamic>val=apiData['results'];
  // print(val);
  // for(int i=0;i<val.length;i++){
  //   list.add(val[i]);
  // }
}

searchEmpty() {
  searchListener.value.clear();
  searchListener.value.addAll(mainmovie);
  searchListener.notifyListeners();
}
