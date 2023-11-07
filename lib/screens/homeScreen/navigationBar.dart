import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:my_bu/loginSignin/logout/logout.dart';
import 'package:my_bu/properties/prop.dart';
import 'package:my_bu/screens/gym/gymStats.dart';
import 'package:my_bu/screens/homeScreen/homeScreen.dart';
import 'package:my_bu/screens/library/libraryStats.dart';
import 'package:my_bu/screens/mess/messStats.dart';

class navigationBar extends StatefulWidget {
  const navigationBar({super.key});

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  List<ScreenHiddenDrawer> _pages = [];
  final myTextStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: rang6,
  );

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'DASHBOARD',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: rang6,
        ),
        homeScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'MESS',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: rang6,
        ),
        messStats(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'GYM',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: rang6,
        ),
        gymStats(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'LIBRARY',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: rang6,
        ),
        libraryStats(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'SETINGS',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: rang6,
        ),
        logout(),
      ),
    ];
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return HiddenDrawerMenu(
      backgroundColorMenu: rangNeutral,
      leadingAppBar: Icon(
        Icons.menu_outlined,
        color: rang6,
      ),
      backgroundColorAppBar: rangBackground,
      verticalScalePercent: 100,
      curveAnimation: Curves.decelerate,
      elevationAppBar: 0,
      tittleAppBar: Text(
        '',
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: rangBackground,
        ),
      ),
      // withShadow: true,
      isDraggable: true,
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 45,
    );
  }
}
