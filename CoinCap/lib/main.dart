import 'dart:convert';
import 'dart:io';
import 'package:coincap/models/app_config.dart';
import 'package:coincap/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'services/https_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  registerHTTPService();
  await GetIt.instance.get<HttpsService>().get("/coins/bitcoin");

  runApp(const MyApp());
}
Future<void> loadConfig() async{
  String _configContent =
  await rootBundle.loadString("assets/config/main.json");
  print("2");
   Map _configData = jsonDecode(_configContent);
   GetIt.instance.registerSingleton<AppConfig>(
     AppConfig(
         COIN_API_BASE_URL: _configData["COIN_API_BASE_URL"])
   );
}
void registerHTTPService(){
  GetIt.instance.registerSingleton<HttpsService>(
    HttpsService(),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinCap',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor:const  Color.fromRGBO(
            88,
            60,
            197,
            1.0
        ),
      ),
      home:HomePage(),
    );
  }
}


