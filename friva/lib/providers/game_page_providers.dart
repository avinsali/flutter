import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestion=10;
  List? question ;
  int _currentQuestionCouont=0;
  BuildContext context;
  GamePageProvider({required this.context}){
   _dio.options.baseUrl='https://opentdb.com/api.php';
   _getQuestionFromAPI();
  }
Future<void> _getQuestionFromAPI() async{
    var _response = await _dio.get(
        '',
        queryParameters: {
          'amount':10 ,
        'type': 'boolean',
        'difficulty':'easy'
        }
        );
    var _data = jsonDecode(
        _response.toString()
    );

    question=_data["result"];
    notifyListeners();

  }
String getCurrentQuestionText(){
    return question![_currentQuestionCouont]["question"];
}
}