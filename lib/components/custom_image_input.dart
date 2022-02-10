import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class CustomImageInput extends StatefulWidget {
  final Function onImageSelect;
  final String urlImage;
  const CustomImageInput({
    Key? key,
    required this.onImageSelect,
    this.urlImage = "",
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
    final savedImage = await selectedImage!.copy('${appDir.path}/$fileName');
    setState(() {});
    widget.onImageSelect(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: CompanyImageHolder(
          urlImage: widget.urlImage,
          fileImage: selectedImage,
        ),
        onTap: _pickImage,
      ),
    );
  }
}

class CompanyImageHolder extends StatelessWidget {
  final String urlImage;
  final File? fileImage;
  const CompanyImageHolder({
    Key? key,
    required this.urlImage,
    this.fileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (fileImage != null) {
      return CircleAvatar(
        radius: 75,
        backgroundColor: Colors.grey,
        backgroundImage: FileImage(fileImage!, scale: 0.1),
      );
    }
    if (urlImage.isNotEmpty) {
      return CircleAvatar(
        radius: 75,
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage(urlImage, scale: 0.1),
      );
    }

    return const CircleAvatar(
      radius: 75,
      backgroundColor: Colors.grey,
    );
  }
}
