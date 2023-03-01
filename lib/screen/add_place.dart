import 'dart:io';

import 'package:flutter/material.dart';
import 'package:locationpicker/provider/great_places.dart';
import 'package:locationpicker/widget/imageinput.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  static const routeName = '/addPlace';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  //creating controllers
  final textcontroller = TextEditingController();
  late File _pickedImage;

  void selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  //form saving
  void savePlace() {
    if (textcontroller.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addplace(textcontroller.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Places'),
        elevation: 0,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: textcontroller,
                ),
                const SizedBox(
                  height: 10,
                ),
                ImageInput(selectImage),
              ],
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: savePlace,
          icon: const Icon(Icons.add),
          label: const Text('Add'),
        )
      ]),
    );
  }
}
