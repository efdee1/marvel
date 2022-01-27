
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:marvel/constants/key.dart';
import 'package:marvel/model/marvel_model.dart';
import 'package:marvel/ui/view/characters.dart';
import 'package:marvel/ui/view/favorite.dart';
import 'package:pmvvm/view_model.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;



class ApplicationViewModel extends ViewModel{



  int _selectedIndex = 0;


  int get selectedIndex => _selectedIndex;
 String? setSelectedIndex(val ){
       _selectedIndex = val;
    switch (val) {
      case "favorites":
        _selectedIndex = 1;
        break;
      case "MarvelCharacters":
        _selectedIndex = 0;
        break;
    }
    notifyListeners();
  }
//////////////////////////////////////////////
  final List<Widget>widgetOptions = <Widget>[
    MarvelCharacters(),
    Favorite()

  ];
  // @override
  // late Future<Marvel>futureMarvel;
  // void init() {
  //   // It's called after the ViewModel is constructed
  //   futureMarvel = fetchMarvel() as Future<Marvel>;
  // }
///////////////////////////////////////////////////////////////////////////////////////////////
  Marvel? models = Marvel();
  // Marvel? _body;
  // Marvel? get body => _body;
  // setBody(val){
  //   _body = val;
  //   notifyListeners();
  // }
  getTimestamp(){
    return DateTime.now();
  }
  var BASE_URL='http://gateway.marvel.com/v1/public/characters';

  // generateMd5(String data) {
  //   var content = new Utf8Encoder().convert(data);
  //   var md5 = crypto.md5;
  //   var digest = md5.convert(content);
  //   return hex.encode(digest.bytes);
  // }





  // String generateMd5(String input) {
  //   return md5.convert(utf8.encode(input)).toString();
  // }
  //



  // List<String> list = [];
  Future loadModels() async{
    // var publickey = publicKey;
    // var privatekey = privateKey;
    // var stringToHash = {getTimestamp();
    // var hash = md5({stringToHash});
    // var baseUrl = 'https://gateway.marvel.com:443/v1/public/characters';
    // var limit = 20;
    // var url = baseUrl + '?limit=' + limit + '&ts=' + ts + '&apikey=' + publickey + '&hash=' + hash;


   // final url = buildUrl("");
    // List<String> list = [];
   // final timestamp = DateTime.now().microsecondsSinceEpoch;
    //   'http://developers.marvel.com/v1/public/characters?&apiKey=c95ce8965c471b169043e399fe49e367'
    //http://gateway.marvel.com/v1/public/comics?ts=1&apikey=c95ce8965c471b169043e399fe49e367
    try{

    //   $res = $client->request('GET', 'http://gateway.marvel.com:80/v1/public/comics', [
    // 'query' => [
    // 'apikey' => $apikey,
    // 'ts' => $now,
    // 'hash' => md5($now . $privateKey . $apikey)
    // ]
    // ]);
     // NTA0NjYwNUU0RDMwQUU2RTA1QTBDQTBDOEI3OUM3RUQ4RTM0ODI2NA==
      //final hash = await generateMd5('${getTimestamp()}7f7924dc0a85287679226111cff29d5c5e19f504c95ce8965c471b169043e399fe49e367');
     //var output = str.convert(utf8.encode(input)).toString();
      final response = await http.get(
        Uri.parse('http://gateway.marvel.com/v1/public/characters?&ts=1&apikey=c95ce8965c471b169043e399fe49e367&hash=fd63f2e1839f0897df95c58c60a69e7d'),
        headers:<String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }  );
      if (response.statusCode == 200) {
        //Decodifico il body del response
        final jsonDecode = json.decode(response.body);

        // final ResponseCharacters characters =
        // ResponseCharacters.fromJson(jsonDecode);

       // final List<Marvel> charactersList = body.data.results;
      // return charactersList;
      } else {
    throw Exception("Errore status code: ${response.body}");
    }
      print(response.body);

   // Marvel body = models!.marvelFromJson(response.body.['data'].['results']);
        //return body;
    }catch(e){
      print(e);
    }

  }

  // buildUrl(String queryUrl) {
  //   final timestamp = DateTime.now().millisecondsSinceEpoch;
  //   final hash = generateMd5('$timestamp$privateKey$publicKey');
  //   return BASE_URL + "$queryUrl?apikey=$publicKey&hash=$hash&ts=$timestamp";
  // }


}