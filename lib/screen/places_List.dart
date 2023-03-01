import 'package:flutter/material.dart';
import 'package:locationpicker/provider/great_places.dart';
import 'package:locationpicker/screen/add_place.dart';
import 'package:provider/provider.dart';

class PlaceslistScreen extends StatelessWidget {
  const PlaceslistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Great Places's"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: const Text('You got no places yet'),
        ),
        builder: (context, greatPlace, child) => greatPlace.items.isEmpty
            ? child!
            : ListView.builder(
                itemCount: greatPlace.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatPlace.items[i].image),
                  ),
                  title: Text(greatPlace.items[i].title),
                ),
              ),
      ),
    );
  }
}
