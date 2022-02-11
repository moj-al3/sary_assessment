import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class CustomImageInput extends StatefulWidget {
  final Function onImageSelect;
  const CustomImageInput({
    Key? key,
    required this.onImageSelect,
  }) : super(key: key);

  @override
  _CustomImageInputState createState() => _CustomImageInputState();
}

class _CustomImageInputState extends State<CustomImageInput> {
  File? selectedImage;
  Future<void> _pickImage() async {
    final XFile? imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile == null) return;
    selectedImage = File(imageFile.path);
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    await selectedImage!.copy('${appDir.path}/$fileName');
    setState(() {});
    widget.onImageSelect(fileName);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: selectedImage != null
            ? Image.file(
                selectedImage!,
                fit: BoxFit.fill,
                width: 250,
                height: 150,
              )
            : Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: const Center(child: Text("Tap here to pick an image")),
                width: 250,
                height: 150,
              ),
        onTap: _pickImage,
      ),
    );
  }
}
