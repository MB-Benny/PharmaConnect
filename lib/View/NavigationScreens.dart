import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BottomNavBar.dart';
import 'CartPageView.dart';
import 'HomePage.dart';
import 'OrdersPageView.dart';
import 'ProfilePageView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Homepage(),
    const Orderspageview(),
    const CartPageView(),
    const Profilepageview(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update selected index
          });
        },
      ),
    );
  }
}

