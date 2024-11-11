import 'dart:convert';
import 'obj.dart';

import 'package:http/http.dart' as http;

class Api{
static Future<List<Objs>> fetchObjs() async{
  final response=await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
  

if(response.statusCode==200){
  final List<dynamic> jsonResponse=jsonDecode(response.body);
  print("Raw,$jsonResponse");
  final objs=jsonResponse.map((json)=>Objs.fromJson(json)).toList();
  print("Final,$objs");
  return objs;
}
else{
  throw Exception('Failed to fetch list');
}
  
}
}