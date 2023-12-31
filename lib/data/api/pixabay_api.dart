import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:searching_image/data/model/photo.dart';

Future<List<Photo>> fetchPhotos(String query) async {
  final response = await http.get(Uri.parse('https://pixabay.com/api/?key=37933558-33cf47fb6f41d74a8d0182295&q=$query'));
  Map<String, dynamic> jsonResponse = json.decode(response.body);
  List<dynamic> hits = jsonResponse['hits'];
  return hits.map((item) => Photo.fromJson(item)).toList();
}
