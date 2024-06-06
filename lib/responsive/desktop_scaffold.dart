import 'package:flutter/material.dart';
import 'package:une_messe/responsive_fragments/home_fragment_desktop.dart';
import '../components/bottomnavigationwidget.dart';
import '../components/top_bar_wdget.dart';
import '../core/constants.dart';
import '../view/fragments/demande_fragment.dart';
import 'package:une_messe/responsive_fragments/shopping_fragment_desktop.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffold();
}

class _DesktopScaffold extends State<DesktopScaffold> {
  int _selectedIndex = 0;
  
  int cartItemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            // SideBar
            Container(
              width: 150,
              color: greenColor[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...ButtomNavigationList.asMap().entries.map((entry) {
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
            // Main content
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 90,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: greenColor[50],
                      child: fragmentList[_selectedIndex]['fragment'],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: TopBarWidget(
                            title: titleFragmentList[_selectedIndex]['title'], 
                            cartItemCount: cartItemCount, 
                            image:titleFragmentList[_selectedIndex]['image'],
                          ),
                  ),
                ],
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
    'fragment': const HomeFragmentDesktop()
  },
  {
    'fragment': const DemandeFragment(),
  },
  {
    'fragment': const ShoppingFragmentDesktop(),
  },
  {
    'fragment': const Center(
      child: Icon(Icons.settings, size: 40)
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
