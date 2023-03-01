import 'dart:io';

import 'package:flutter/material.dart';
import 'package:locationpicker/model/place.dart';
import 'package:provider/provider.dart';

class GreatPlaces with ChangeNotifier {
  //creating a list of places
  List<Place> _items = [];

  //getter for retreving a copy of items
  List<Place> get items {
    return [..._items];
  }

  //method for sub place
  void addplace(String pickedtitle, File pickedImage) {
    final newplace = Place(
      pickedtitle,
      null,
      pickedImage,
      id: DateTime.now().toIso8601String(),
    );
    _items.add(newplace);
    notifyListeners();
  }
}
