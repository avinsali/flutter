import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_moon/widgets/custom_dropdown_butten.dart';

class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    _deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pageTitle(),
                  _bookRightWidget(),

                ],
              ),
              Align(
                alignment: Alignment.centerRight,
              child:
              _astroImagewidget()
              )
            ],
          )
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return Text("🚀G0Moon🚀",

        style: TextStyle(color: Colors.white,
          fontSize: 48,
          fontWeight: FontWeight.w800,
        ));
  }

  Widget _astroImagewidget() {
    return Container(
      height: _deviceHeight*0.5,
      width: _deviceWidth*0.65,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/images/astro_moon.png"),)
      ),
    );
  }
Widget _bookRightWidget(){
    return Container(
      height: _deviceHeight*0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _destinationDropDownWidget(),
        _travellersInformationWidget(),
        _rideButton()
      ],
    ),);

}
  Widget _destinationDropDownWidget() {
    return CustomDropDownButtonClass(values: const[
      "James webb station ",
      "preneure station "], width: _deviceWidth
    );
  }
  Widget _travellersInformationWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        CustomDropDownButtonClass(values: const[
      "1 ",
      "2 ",
      "3",
      "4",
      "5"], width: _deviceWidth*0.45
    ),
          CustomDropDownButtonClass(values: const[
            "economy ",
            "Business ",
            "First",
            "Privatee"], width: _deviceWidth*0.40
          )
    ]
        );
  }
  Widget _rideButton(){
    return Container(
      padding: EdgeInsets.only(bottom: _deviceWidth*0.01 ),
      width:_deviceWidth ,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: (){},
        child:const Text(
          "Book Ride!",
          style: TextStyle(
              color: Colors.black),),),

    );
  }
}
