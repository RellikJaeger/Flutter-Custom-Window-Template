import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    final initialSize = Size(600, 450);
    appWindow.minSize = Size(400, 230);
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = 'Flutter Custom Window Template';
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WindowBorder(
          color: Color(0xFFFFFFFF),
          width: 0,
          child: Container(
            color: Color(0xFFFFFFFF),
            child: Column(
              children: [
                WindowTitleBarBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(0.1),
                          child: Container(
                            color: Color(0xFF171717),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 9, top: 7, right: 5, bottom: 7),
                                            child: Image.asset('assets/drawable/playstore.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 0),
                                            child: Text(
                                              'Flutter Custom Window Template',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ), // Text style
                                            ), // Text
                                          ), // Padding
                                        ], // Column children
                                      ), // Column
                                      MoveWindow(), // MoveWindow
                                    ], // Stack children
                                  ), // Stack
                                ), // Expended
                                WindowButtons(), // WindowButtons
                              ], // Column children
                            ), // Column
                          ), // Inner Container
                        ), // Outer Container
                      ), // Expanded
                    ], // Row children
                  ), // Row
                ), // WindowTitleBarBox
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 0.1, bottom: 0.1, left: 0.1), // Container margin
                    color: Color(0xFF111111), // Container color
                  ), // Container
                ), // Expanded
              ], // Column children
            ), // Column
          ), // Container
        ), // WindowBorder
      ), // Scaffold
    ); // MaterialApp
  } // MyApp Widget build
} // MyApp class

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: WindowButtonColors(
            iconNormal: Color(0xFF8B8B90),
            iconMouseOver: Color(0xFFFBFBFE),
            iconMouseDown: Color(0xFFFBFBFE),
            mouseOver: Color(0xFF2F302C),
            mouseDown: Color(0xFF656469),
          ), // MinimizeWindowButton colors
        ), // MinimizeWindowButton
        MaximizeWindowButton(
          colors: WindowButtonColors(
            iconNormal: Color(0xFF8B8B90),
            iconMouseOver: Color(0xFFFBFBFE),
            iconMouseDown: Color(0xFFFBFBFE),
            mouseOver: Color(0xFF2F302C),
            mouseDown: Color(0xFF656469),
          ), // MaximizeWindowButton colors
        ), // MaximizeWindowButton
        CloseWindowButton(
          colors: WindowButtonColors(
            iconNormal: Color(0xFFB1B1B5),
            iconMouseOver: Color(0xFFFBFBFE),
            iconMouseDown: Color(0xFFFFFFFF),
            mouseOver: Color(0xFFE81123),
            mouseDown: Color(0xFFF16F7A),
          ), // CloseWindowButton colors
        ), // CloseWindowButton
      ], // Row children
    ); // Row
  } // WindowButtons Widget build
} // WindowButtons class
