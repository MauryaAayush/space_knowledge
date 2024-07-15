import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/model_class.dart';

class JsonProvider with ChangeNotifier {
  List<Planet> userList = [];
  List<Planet> bookmarkedList = [];

  JsonProvider() {
    _loadBookmarkedPlanets();
  }

  void _loadBookmarkedPlanets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? bookmarkedPlanets = prefs.getStringList('bookmarkedPlanets');
    if (bookmarkedPlanets != null) {
      bookmarkedList = userList
          .where((planet) => bookmarkedPlanets.contains(planet.name))
          .toList();
      notifyListeners();
    }
  }

  void toggleBookmark(Planet planet) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (bookmarkedList.contains(planet)) {
      bookmarkedList.remove(planet);
    } else {
      bookmarkedList.add(planet);
    }
    List<String> bookmarkedPlanets =
    bookmarkedList.map((planet) => planet.name).toList();
    prefs.setStringList('bookmarkedPlanets', bookmarkedPlanets);
    notifyListeners();
  }
}
