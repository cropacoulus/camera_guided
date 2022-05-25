import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  File? imageFile;
  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      //imagePath
      imageFile = File(image!.path);
    });
  }

  Future getImageFromGallery() async {
    final image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      //imagePath
      imageFile = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Guide Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageFile == null ? const Text('No image selected.') : Expanded(child:Image.file(imageFile!)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: getImageFromGallery,
              child: const Text('Image From Galery'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: getImage,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
