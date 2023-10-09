import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:market/model/hisob.dart';
import 'package:market/model/tovar.dart';
import 'package:market/screens/home_page.dart';

late Box box;
late Box hisobBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  box = await Hive.openBox<Tovar>('tovar');
  Hive.registerAdapter(TovarAdapter());

  hisobBox = await Hive.openBox<Hisob>('hisob');
  Hive.registerAdapter(HisobAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
