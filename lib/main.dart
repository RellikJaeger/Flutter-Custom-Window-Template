import 'dart:io' show Platform;

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import 'res/color.dart';
import 'res/drawable.dart';
import 'res/string.dart';
import 'res/style.dart';
import 'ui/home.dart';

void main() {
  runApp(const MyApp());
  if (Platform.isWindows) {
    doWhenWindowReady(() {
      const initialSize = AppStyles.windowSize;
      appWindow.minSize = AppStyles.minWindowSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.title = AppStrings.appName;
      appWindow.show();
    });
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  bool isMaximized = false;

  @override
  Widget build(BuildContext context) {
    WindowTitleBarBox windowTitleBarBox = WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(0),
              child: Container(
                color: AppColors.windowTitleBarColor,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 9, top: 7, right: 5, bottom: 7),
                                child: Image.asset(
                                  AppDrawables.icLauncher,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  AppStrings.appName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MoveWindow(),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        MinimizeWindowButton(
                          colors: WindowButtonColors(
                            iconNormal: const Color(0xFF8B8B90),
                            iconMouseOver: const Color(0xFFFBFBFE),
                            iconMouseDown: const Color(0xFFFBFBFE),
                            mouseOver: const Color(0xFF2F302C),
                            mouseDown: const Color(0xFF656469),
                          ),
                        ),
                        isMaximized
                            ? RestoreWindowButton(
                                onPressed: () {
                                  setState(() {
                                    isMaximized = false;
                                    appWindow.maximizeOrRestore();
                                  });
                                },
                                colors: WindowButtonColors(
                                  iconNormal: const Color(0xFF8B8B90),
                                  iconMouseOver: const Color(0xFFFBFBFE),
                                  iconMouseDown: const Color(0xFFFBFBFE),
                                  mouseOver: const Color(0xFF2F302C),
                                  mouseDown: const Color(0xFF656469),
                                ),
                              )
                            : MaximizeWindowButton(
                                onPressed: () {
                                  setState(() {
                                    isMaximized = true;
                                    appWindow.maximizeOrRestore();
                                  });
                                },
                                colors: WindowButtonColors(
                                  iconNormal: const Color(0xFF8B8B90),
                                  iconMouseOver: const Color(0xFFFBFBFE),
                                  iconMouseDown: const Color(0xFFFBFBFE),
                                  mouseOver: const Color(0xFF2F302C),
                                  mouseDown: const Color(0xFF656469),
                                ),
                              ),
                        CloseWindowButton(
                          colors: WindowButtonColors(
                            iconNormal: const Color(0xFFB1B1B5),
                            iconMouseOver: const Color(0xFFFBFBFE),
                            iconMouseDown: const Color(0xFFFFFFFF),
                            mouseOver: const Color(0xFFE81123),
                            mouseDown: const Color(0xFFF16F7A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pointerListener(
        child: Scaffold(
          body: WindowBorder(
            color: Colors.white,
            width: 0.2,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  if (Platform.isWindows) windowTitleBarBox,
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              right: 0.0, bottom: 0.0, left: 0.0),
                          color: AppColors.appBackgroundColor,
                        ),
                        const Home(title: AppStrings.appName),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Wrap the whole page to listen pointer more accurately
  pointerListener({required Scaffold child}) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerSignal: (PointerEvent details) {
        setState(() {
          isMaximized = appWindow.isMaximized;
        });
      },
      onPointerHover: (PointerEvent details) {
        setState(() {
          isMaximized = appWindow.isMaximized;
        });
      },
      onPointerDown: (PointerEvent details) {
        setState(() {
          isMaximized = appWindow.isMaximized;
        });
      },
      onPointerMove: (PointerEvent details) {
        setState(() {
          isMaximized = appWindow.isMaximized;
        });
      },
      onPointerUp: (PointerEvent details) {
        setState(() {
          isMaximized = appWindow.isMaximized;
        });
      },
      onPointerCancel: (PointerEvent details) {
        setState(() {
          isMaximized = appWindow.isMaximized;
        });
      },
      child: child,
    );
  }
}

class RestoreWindowButton extends WindowButton {
  RestoreWindowButton(
      {Key? key,
      WindowButtonColors? colors,
      VoidCallback? onPressed,
      bool? animate})
      : super(
            key: key,
            colors: colors,
            animate: animate ?? false,
            iconBuilder: (buttonContext) =>
                RestoreIcon(color: buttonContext.iconColor),
            onPressed: onPressed ?? () => appWindow.maximizeOrRestore());
}
