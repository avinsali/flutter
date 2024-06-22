import 'package:flutter/material.dart';
import 'package:taskly2/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter("hive_boxes");
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Taskly",
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
         useMaterial3: true,
        ),
      home: HomePage(),
    );
  }
}


