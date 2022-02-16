import 'package:flutter/material.dart';

import '../res/color.dart';
import '../res/drawable.dart';
import '../res/string.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appTitleBarColor,
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.drawerBackgroundColor,
        child: ListView(
          children: [
            SizedBox(
              height: 260,
              child: DrawerHeader(
                margin: const EdgeInsets.all(0.0),
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  AppDrawables.drawerHeaderImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              title: const Text(
                AppStrings.homePage,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              selected: _selectedDestination == 0,
              onTap: () => selectDestination(0),
            ),
            ListTile(
              leading: const Icon(
                Icons.bookmarks_outlined,
                color: Colors.white,
              ),
              title: const Text(
                AppStrings.bookmarks,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              selected: _selectedDestination == 1,
              onTap: () => selectDestination(1),
            ),
            ListTile(
              leading: const Icon(
                Icons.download_outlined,
                color: Colors.white,
              ),
              title: const Text(
                AppStrings.downloads,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              selected: _selectedDestination == 2,
              onTap: () => selectDestination(2),
            ),
            ListTile(
              leading: const Icon(
                Icons.date_range_outlined,
                color: Colors.white,
              ),
              title: const Text(
                AppStrings.schedules,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              selected: _selectedDestination == 3,
              onTap: () => selectDestination(3),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
              title: const Text(
                AppStrings.settings,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              selected: _selectedDestination == 4,
              onTap: () => selectDestination(4),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: AppColors.appBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppStrings.helloWorld,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
