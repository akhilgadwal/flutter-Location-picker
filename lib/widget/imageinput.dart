import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as sypath;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  final Function onselectimages;

  const ImageInput(this.onselectimages, {super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? storedImage;
  Future<void> takepicutre() async {
    final picker = ImagePicker();
    final imagefile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imagefile == null) {
      return;
    }
    setState(() {
      storedImage = File(imagefile.path);
    });
    //setting app directory
    final appDir = await sypath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imagefile.path);
    final saveImage =
        await File(imagefile.path).copy('${appDir.path}/$fileName');
    widget.onselectimages(saveImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 130,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: storedImage != null
              ? Image.file(storedImage!)
              : Text(
                  'No image Taken',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: takepicutre,
            icon: const Icon(Icons.camera),
            label: const Text('Take a picture'),
          ),
        ),
      ],
    );
  }
}
