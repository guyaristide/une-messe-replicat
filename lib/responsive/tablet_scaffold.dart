import 'package:flutter/material.dart';
import 'package:une_messe/responsive_fragments/home_fragment_tablet.dart';
import '../components/bottomnavigationwidget.dart';
import '../components/top_bar_wdget.dart';
import '../core/constants.dart';
import '../view/fragments/demande_fragment.dart';
import '../view/fragments/shopping_fragment.dart';

class TabletScaffold extends StatefulWidget{
  const TabletScaffold({super.key});

  @override
  State<TabletScaffold> createState() => _TabletScaffold();
  
}

class _TabletScaffold extends State<TabletScaffold> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context){
    int cartItemCount = 0 ;
    return  Scaffold(
      bottomNavigationBar: Container(
                color: greenColor[50],
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
                          iconPath: item['iconPath'],
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
                  color: greenColor[50],
                  child: fragmentList[_selectedIndex]['fragment'],
                )),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: 
            TopBarWidget(
              title: titleFragmentList[_selectedIndex]['title'], cartItemCount: cartItemCount, image: '',),
            ),
          ],
        ),
      ),
    ); 
  }
}

final List<Map<String, dynamic>> fragmentList = [
  {
    'fragment': const HomeFragmentTablet()
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
    'title': "Bienvenue"
  },
  {
    'title': "Choisissez votre messe"
  },
  {
    'title': "Panier de priere"
  },
  {
    'title': "Paramètres"
  },
];