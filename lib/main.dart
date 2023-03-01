import 'package:flutter/material.dart';
import 'package:locationpicker/provider/great_places.dart';
import 'package:locationpicker/screen/add_place.dart';

import 'screen/places_List.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home: PlaceslistScreen(),
          routes: {AddPlaceScreen.routeName: (ctx) => const AddPlaceScreen()}),
    );
  }
}
