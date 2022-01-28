
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:marvel/model/model_marv.dart';
import 'package:marvel/model/my_model.dart';
import 'package:marvel/ui/view/characters.dart';
import 'package:marvel/ui/view/favorite.dart';
import 'package:pmvvm/view_model.dart';
import 'package:http/http.dart'as http;



class ApplicationViewModel extends ViewModel {


  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  String? setSelectedIndex(val) {
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
    const MarvelCharacters(),
    const Favorite()

  ];
  /////////////////////////////api///////////////////////////////
  Marv? data = Marv();
  Marv? body;
  Future<Marv> loadMarv() async {
    try {
      var response = await http.get(
          Uri.parse(
              'http://gateway.marvel.com/v1/public/characters?&ts=1&apikey=c95ce8965c471b169043e399fe49e367&hash=fd63f2e1839f0897df95c58c60a69e7d'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (response.statusCode == 200) {
        var zz = json.decode(response.body);
        final marv = Marv.fromJson(zz);
        body = marv;
        return marv;
      } else {
        throw Exception("Errore status code: ${response.body}");
      }
    } catch (e) {
      throw Exception("Errore status code");
    }
  }
/////////adding to favourites///////////
  final List<User>_userList = [];

  UnmodifiableListView<User> get userList => UnmodifiableListView(_userList);
  addUser(User user){
    _userList.add(user);
    notifyListeners();
  }
  deleteUser(index){
    _userList.removeWhere((_user) => _user.name== userList[index].name);
    notifyListeners();
  }
}