import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


class HisobPage extends StatefulWidget {
  final Box box;

  const HisobPage({super.key, required this.box});

  @override
  State<HisobPage> createState() => _HisobPageState();
}

class _HisobPageState extends State<HisobPage> {
  double foyda = 0;

  @override
  void initState() {
    widget.box.values.forEach((element) {
      foyda = foyda + element.foyda;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hisob Sahifasi')),
        body: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: widget.box.listenable(),
                  builder: (
                    context,
                    box,
                    child,
                  ) {
                    return ListView.builder(
                        itemCount: widget.box.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black)),
                            width: MediaQuery.sizeOf(context).width,
                            height: 80,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.memory(base64.decode(
                                      widget.box.getAt(index).tovar.image)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Nomi:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        Text(box.getAt(index).tovar.nomi)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('soni:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        Text(box.getAt(index).soni.toString())
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('foyda:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        Text(box.getAt(index).foyda.toString())
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  }),
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.green[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Foyda:',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 20,
                  ),
                  Text(foyda.toString(),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ));
  }
}
