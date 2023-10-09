import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:market/main.dart';
import 'package:market/model/hisob.dart';
import 'package:market/model/tovar.dart';
import 'package:market/screens/add_screen.dart';
import 'package:market/screens/hisob_page.dart';
import 'package:market/screens/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Savdo oynasi"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => HisobPage(
                                box: hisobBox,
                              )));
                },
                icon: Icon(Icons.book)),
          ),
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, box, child) {
            return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  return WidgetsItem(
                    tovar: box.getAt(index),
                    onSotishTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                width: 300,
                                height: 250,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          box.getAt(index).nomi,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextField(
                                            controller: txt,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'miqdorni kiriting'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                            child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: MaterialButton(
                                                  height: 40,
                                                  onPressed: () {
                                                    if (box.getAt(index).soni <=
                                                        0) {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return Dialog(
                                                              child: Container(
                                                                width: 300,
                                                                height: 250,
                                                                color: Colors
                                                                    .white,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Text(
                                                                          box
                                                                              .getAt(index)
                                                                              .nomi,
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25),
                                                                        ),
                                                                        Text(
                                                                            "Maxsulot yoqku yaxshilab e'tibor bering")
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Expanded(
                                                                            child:
                                                                                Row(
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: MaterialButton(
                                                                                  height: 40,
                                                                                  onPressed: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  color: Colors.orange,
                                                                                  child: Text(
                                                                                    'Bekor qilish',
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  )),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    } else {
                                                      int umumiySoni =
                                                          box.getAt(index).soni;
                                                      int sotish = int.parse(
                                                          txt.value.text);
                                                      int qolganSoni =
                                                          umumiySoni - sotish;
                                                      double foyda = (box
                                                              .getAt(index)
                                                              .narxi -
                                                          box
                                                              .getAt(index)
                                                              .TanNarxi);
                                                      Tovar tovar = Tovar(
                                                          nomi: box
                                                              .getAt(index)
                                                              .nomi,
                                                          narxi: box
                                                              .getAt(index)
                                                              .narxi,
                                                          TanNarxi: box
                                                              .getAt(index)
                                                              .TanNarxi,
                                                          soni: qolganSoni,
                                                          image: box
                                                              .getAt(index)
                                                              .image);
                                                      hisobBox.add(Hisob(
                                                          tovar: tovar,
                                                          soni: sotish,
                                                          foyda: foyda));

                                                      box.putAt(index, tovar);
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  color: Colors.orange,
                                                  child: Text(
                                                    "Sotish",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: MaterialButton(
                                                  height: 40,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  color: Colors.orange,
                                                  child: Text(
                                                    'Bekor qilish',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            ),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    onOlishTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                width: 300,
                                height: 250,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          box.getAt(index).nomi,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextField(
                                            controller: txt,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'miqdorni kiriting'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                            child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: MaterialButton(
                                                  height: 40,
                                                  onPressed: () {
                                                    int umumiySoni =
                                                        box.getAt(index).soni;
                                                    int olish = int.parse(
                                                        txt.value.text);
                                                    int qolganSoni =
                                                        umumiySoni + olish;
                                                    Tovar tovar = Tovar(
                                                        nomi: box
                                                            .getAt(index)
                                                            .nomi,
                                                        narxi: box
                                                            .getAt(index)
                                                            .narxi,
                                                        TanNarxi: box
                                                            .getAt(index)
                                                            .TanNarxi,
                                                        soni: qolganSoni,
                                                        image: box
                                                            .getAt(index)
                                                            .image);
                                                    box.putAt(index, tovar);
                                                    Navigator.pop(context);
                                                  },
                                                  color: Colors.orange,
                                                  child: Text(
                                                    "Olish",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: MaterialButton(
                                                  height: 40,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  color: Colors.orange,
                                                  child: Text(
                                                    'Bekor qilish',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            ),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => Add_Screen(
                          box: box,
                        )));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green),
    );
  }
}
