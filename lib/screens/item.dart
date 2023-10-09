import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market/model/tovar.dart';

class WidgetsItem extends StatefulWidget {
  final Tovar tovar;
  final VoidCallback? onSotishTap;
  final VoidCallback? onOlishTap;

  WidgetsItem(
      {required this.tovar,
      required this.onSotishTap,
      required this.onOlishTap});

  @override
  State<WidgetsItem> createState() => _WidgetsItemState();
}

class _WidgetsItemState extends State<WidgetsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.sizeOf(context).width,
      height: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Image.memory(
            base64Decode(widget.tovar.image),
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          )),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 30,
            color: Colors.green,
            child: Center(
                child: Text(
              widget.tovar.nomi,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                        height: 60,
                        onPressed: () {},
                        color: Colors.orange,
                        child: Text(
                          widget.tovar.narxi.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                        height: 60,
                        onPressed: () {},
                        color: Colors.orange,
                        child: Text(
                          widget.tovar.soni.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              )),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                        height: 60,
                        onPressed: widget.onSotishTap,
                        color: Colors.red,
                        child: Text(
                          'Sotish',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                        height: 60,
                        onPressed: widget.onOlishTap,
                        color: Colors.green,
                        child: Text(
                          'Olish',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }
}
