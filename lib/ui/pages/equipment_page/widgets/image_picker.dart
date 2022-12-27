import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Image Picker from Gallery"),
          backgroundColor: Colors.redAccent),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 20.w,
            left: 20.w,
            right: 20.w,
          ),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: const Text("Pick Image")),
              image == null
                  ? Container()
                  : SizedBox(
                      height: 104.w,
                      child: Image.file(
                        File(image!.path),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
