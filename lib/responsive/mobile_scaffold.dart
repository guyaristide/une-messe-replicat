import 'package:flutter/material.dart';
import 'package:une_messe/responsive_fragments/shopping_fragment_mobile.dart';

import '../components/bottomnavigationwidget.dart';
import '../components/top_bar_wdget.dart';
import '../core/constants.dart';
import '../view/fragments/demande_fragment.dart';
//import '../view/fragments/shopping_fragment.dart';
import '../responsive_fragments/home_fragment_mobile.dart';

class MobileScaffold extends StatefulWidget{
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffold();
  
}

class _MobileScaffold extends State<MobileScaffold> {

  int _selectedIndex = 0;
  
  int  cartItemCount = 1;
  

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      bottomNavigationBar: Container(
                color: const Color(0xFFFDF7F1),
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
                    }),
                  ],
                ),
              ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 90,
                bottom:0,
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
              title: titleFragmentList[_selectedIndex]['title'], cartItemCount: cartItemCount, image:titleFragmentList[_selectedIndex]['image'],),
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
    'title': "Bienvenue",
    'image': "assets/images/Waving Hand Medium Dark Skin Tone.png"    
  },
  {
    'title': "Choisissez votre messe",
    'image':"assets/images/Folded Hands Medium Dark Skin Tone.png"
  },
  {
    'title': "Panier de priere",
    'image':"assets/images/Raising Hands Medium Dark Skin Tone.png"
  },
  {
    'title': "Paramètres",
    'image':"assets/images/Hammer And Wrench.png"
  },
];