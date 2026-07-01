import 'package:flutter/material.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';

class MainAppBar {
    static AppBar appBar(String title) {
    return AppBar(
      title: ValueListenableBuilder(valueListenable: userState.userName, builder: (context, name, child) {
        if (title.isEmpty) {
          return Text('Welcome, $name', style: TextStyle(fontSize: TextSizing.large),);
        }
        return Text(title, style: TextStyle(fontSize: TextSizing.large),);
      }),
      // title: Text(title, style: TextStyle(fontSize: TextSizing.large),),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      // leading: GestureDetector(
      //   onTap: () {},
      //   child: Container(
      //     margin: EdgeInsets.all(5),
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //       color: Colors.blueAccent,
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //     child: Icon(Icons.menu),
      //     // child: SvgPicture.asset('assets/icons/hamburger-menu.svg'),
      //     // child: SvgPicture.asset('assets/icons/LefArrow.svg'),
      //   ),
      // ),
    );
  }
}