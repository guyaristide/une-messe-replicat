import 'package:flutter/material.dart';
import 'package:une_messe/core/constants.dart';

import 'components/BottomNavigationWidget.dart';
import 'home/fragments/demande_fragment.dart';
import 'home/fragments/home_fragment.dart';

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
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                bottom: 60,
                left: 0,
                right: 0,
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: PADDING*2),
                  color: greenColor.withOpacity(0.15),
                  child: fragmentList[_selectedIndex]['fragment'],
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: greenColor.withOpacity(0.1),
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
      ),
    );
  }
}

final List<Map<String, dynamic>> fragmentList = [
  {
    'fragment': const HomeFragment()
  },
  {
    'fragment': const DemandeFragment(),
  },
  {
    'fragment': const Center(
      child: Text(
        'Contenu du panier',
        style: TextStyle(fontSize: 24.0),
      ),
    ),
  },
  {
    'fragment': const Center(
      child: Text(
        'Contenu du parametre',
        style: TextStyle(fontSize: 24.0),
      ),
    ),
  },
];



