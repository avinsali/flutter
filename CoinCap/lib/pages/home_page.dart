import 'package:coincap/services/https_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _HomePageState();
  }
}
 class _HomePageState extends State<HomePage> {
  double? _deviceHeight , _deviceWidth ;
   HttpsService? _http ;
   @override
   void initState(){
     super.initState();
     _http = GetIt.instance.get<HttpsService>();
   }
   Widget build(BuildContext context) {
     _deviceHeight=MediaQuery.of(context).size.height;
     _deviceWidth=MediaQuery.of(context).size.width;
     return Scaffold(
       body: SafeArea(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           mainAxisSize: MainAxisSize.max,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             _selectedCoinDropdown(),
           ],
         ),
       ),
     );
   }
   Widget _selectedCoinDropdown(){
     List<String> _coins = ["bitcoin"];
     List<DropdownMenuItem> _items = _coins
         .map(
             (e)=>
                 DropdownMenuItem(
                   value: e,
                     child: Text(e),
                 ),
     ).toList();
     return DropdownButton(
         value :_coins.first,
         items: _items,
         onChanged: (_value){},
     dropdownColor: const Color.fromRGBO(83, 88, 206, 1.0),
     iconSize: 40,);

   }
 }