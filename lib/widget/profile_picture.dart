import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key, this.size = 34});

  final double size;

  @override
  State<ProfilePicture> createState() => _ProfilePicture();
}

class _ProfilePicture extends State<ProfilePicture> {
  var imageFile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: imageFile != null ? Image.file(
            imageFile,
            fit: BoxFit.cover,
          ).image : null,
          radius: widget.size,
        ),
        IconButton(
          icon: Icon(Icons.photo_camera),
          onPressed: () => _getFromGallery(),
        ),
      ],
    );
  }

   _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (pickedFile != null) {
      setState(() => imageFile = File(pickedFile.path));
    }
  }
}