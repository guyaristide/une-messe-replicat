import 'package:flutter/material.dart';

import 'components/BottomNavigationWidget.dart';
import 'components/top_bar_wdget.dart';
import 'core/constants.dart';
import 'home/fragments/demande_fragment.dart';
import 'home/fragments/home_fragment.dart';
import 'home/fragments/shopping_fragment.dart';
class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
                color: greenColor.withOpacity(0.1),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
                top:  90,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: PADDING*2),
                  color: greenColor.withOpacity(0.15),
                  child: fragmentList[_selectedIndex]['fragment'],
                )),
             Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: 
             TopBarWidget(
              title: titleFragmentList[_selectedIndex]['title'],),
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
    'fragment': const ShoppingFragment(),
  },
  {
    'fragment': const Center(
      child: Icon(Icons.settings,size:40)
    ),
  },
];

final List<Map<String, dynamic>> titleFragmentList = [
  {
    'title': "assets/images/Bienvenue👋🏾.png"
  },
  {
    'title': "assets/images/Choisissez.votre.messe🙏🏾.png"
  },
  {
    'title': "assets/images/Panier-de-prières🙌🏾.png"
  },
  {
    'title': "assets/images/Bienvenue👋🏾.png"
  },
];



