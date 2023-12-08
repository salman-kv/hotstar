import 'dart:convert';

import 'package:hotstar/function/movie.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://api.themoviedb.org/3/';
const apikey = '?api_key=309101d3dc7e4c3c6b9970ea9fcfb5b0';
const searchUri ='https://api.themoviedb.org/3/search/movie?api_key=309101d3dc7e4c3c6b9970ea9fcfb5b0&query=';

getdata(String url, List<dynamic> list) async {
  Uri uri = Uri.parse("$baseUrl$url$apikey");
  final response = await http.get(uri);
  final data = response.body;
  final  maindata = jsonDecode(data);
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
