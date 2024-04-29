import 'package:flutter/material.dart';
import 'package:une_messe/core/constants.dart';

import 'components/BottomNavigationWidget.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: greenColor.withOpacity(0.1),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      fragmentList[_selectedIndex]['fragment'],
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...ButtomNavigationList.asMap().entries.map((entry){
                    final index = entry.key;
                    final item = entry.value;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: ButtomNavigationWidget(
                        label: item['label'],
                        icon: item['icon'],
                        indexSelected: _selectedIndex,
                         currentIndex: index,
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> fragmentList = [
  {
    'fragment': const Center(
      child: Text(
        'Contenu de l\'Accueil',
        style: TextStyle(fontSize: 24.0),
      ),
    ),
  },
  {
    'fragment': const Center(
      child: Text(
        'Contenu de la Recherche',
        style: TextStyle(fontSize: 24.0),
      ),
    ),
  },
  {
    'fragment': const Center(
      child: Text(
        'Contenu des Notifications',
        style: TextStyle(fontSize: 24.0),
      ),
    ),
  },
  {
    'fragment': const Center(
      child: Text(
        'Contenu du Profil',
        style: TextStyle(fontSize: 24.0),
      ),
    ),
  },
];



