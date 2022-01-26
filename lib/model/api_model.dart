
//
// import 'dart:convert';
//
// import 'marvel_model.dart';
// import 'package:http/http.dart 'as http;
//
// class HeroClass{
//   List<MarvelModel>details = [];
//   Future<void>getDetails()async{
 //   String url=  "http://developers.marvel.com/v1/public/characters?&apiKey=c95ce8965c471b169043e399fe49e367";
//    var response = await http.get(url);
//
//     var jsonDate = jsonDecode(response.body);
//     // if(jsonDate['status']=="ok"){
//     //   jsonDate["characters"].forEach((element){
//     //     if(element["urlToImage"] != null && element['description'] != null){
//     //       MarvelModel marvelModel  = MarvelModel(
//     //           image:element['pictures']
//     //           character:element['name']
//     //       );
//     //
//     //       details.add(marvelModel);
//     //     }
//     //
//     //   });
//     // }
//   }
// }
import 'package:http/http.dart'as http;

Future<http.Response> fetchMarvel() {
  return http.get(Uri.parse('http://developers.marvel.com/v1/public/characters?&apiKey=c95ce8965c471b169043e399fe49e367'));
}