import 'package:flutter/material.dart';
import 'package:friva/providers/game_page_providers.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  double? _deviceHeight , _deviceWidth ;
  GamePageProvider? _PageProvider;
  @override
  Widget build(BuildContext context) {

    _deviceHeight= MediaQuery.of(context).size.height;
    _deviceWidth=MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_context)=> GamePageProvider(
          context: context),
      child: _buildUI(),

    );
  }
  Widget _buildUI(){
    return Builder(
        builder: (_context) {
      _PageProvider = _context.watch<GamePageProvider>();
      if (_PageProvider!.question !=null){
        return Scaffold(
          body: SafeArea(
            child:Container(
              padding: EdgeInsets.symmetric(
                  horizontal: _deviceHeight!*0.05,
              ),
              child: _gameUI(),) ,),);}
        else{
          return   const Center(
            child:
            CircularProgressIndicator(color: Colors.white,),);}
      }
    );
  }

  Widget _gameUI(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _questionText(),
        Column(
          children: [
            _trueButten(),
            SizedBox(
              height: _deviceHeight! * 0.01,
            ),
            _falseButten(),
          ],
        )
      ],

    );
  }
  Widget _questionText(){
    return   Text(
      _PageProvider!.getCurrentQuestionText(),
      style: const TextStyle(
          color: Colors.white,
      fontSize:25,
      fontWeight:  FontWeight.w400),
    );
  }
  Widget _trueButten(){
    return MaterialButton(
      onPressed: (){},
      color:Colors.green,
      minWidth: _deviceWidth!*0.80,
      height: _deviceHeight!*0.1,
      child: const Text("True", style: TextStyle(color:Colors.white,
      fontSize: 25
      ),),
    );
  }
  Widget _falseButten(){
    return MaterialButton(
      onPressed: (){},
      color:Colors.red,
      minWidth: _deviceWidth!*0.80,
      height: _deviceHeight!*0.1,
      child: const Text("False", style: TextStyle(color:Colors.white,
          fontSize: 25
      ),),
    );
  }
}