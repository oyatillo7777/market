import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market/model/tovar.dart';

class Add_Screen extends StatefulWidget {
  final Box box;

  Add_Screen({
    required this.box,
  });

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  File? file;
  ImagePicker imagePicker = ImagePicker();
  TextEditingController controllerNomi = TextEditingController();
  TextEditingController controllerMiqdor = TextEditingController();
  TextEditingController controllerNarx = TextEditingController();
  TextEditingController controllerTanNarx = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maxsulot qoshish')),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  pickImage();
                },
                child: Container(
                    width: 250,
                    height: 250,
                    child: file == null
                        ? const Icon(Icons.add)
                        : Image.file(file!)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllerNomi,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'mahsulot nomi'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllerTanNarx,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Tan narxi'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllerNarx,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Sotish narxi'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllerMiqdor,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'miqdori'),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  saqla(
                      controllerNomi.value.text,
                      double.parse(controllerTanNarx.value.text),
                      double.parse(controllerNarx.value.text),
                      int.parse(controllerMiqdor.value.text),
                      file!);
                  Navigator.pop(context);
                },
                color: Colors.green,
                child: Text('Save', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }

  void pickImage() async {
    var img = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  void saqla(
      String nomi, double TanNarxi, double narxi, int soni, File rasm) async {
    Uint8List images = await rasm.readAsBytesSync();
    String base64String = base64.encode(images);
    widget.box.add(Tovar(
        nomi: nomi,
        TanNarxi: TanNarxi,
        narxi: narxi,
        soni: soni,
        image: base64String));
  }
}
