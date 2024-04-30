import 'package:flutter/material.dart';


// 0xFFB24F44 #B24F44
Map<int, Color> color0 = {
  50: const Color.fromRGBO(178, 79, 68, .1),
  100: const Color.fromRGBO(178, 79, 68, .2),
  200: const Color.fromRGBO(178, 79, 68, .3),
  300: const Color.fromRGBO(178, 79, 68, .4),
  400: const Color.fromRGBO(178, 79, 68, .5),
  500: const Color.fromRGBO(178, 79, 68, .6),
  600: const Color.fromRGBO(178, 79, 68, .7),
  700: const Color.fromRGBO(178, 79, 68, .8),
  800: const Color.fromRGBO(178, 79, 68, .9),
  900: const Color.fromRGBO(178, 79, 68, 1),
};

// 0xFFD7E0D9 #D7E0D9
Map<int, Color> color1 = {
  50: const Color.fromRGBO(215, 224, 217, .1),
  100: const Color.fromRGBO(215, 224, 217, .2),
  200: const Color.fromRGBO(215, 224, 217, .3),
  300: const Color.fromRGBO(215, 224, 217, .4),
  400: const Color.fromRGBO(215, 224, 217, .5),
  500: const Color.fromRGBO(215, 224, 217, .6),
  600: const Color.fromRGBO(215, 224, 217, .7),
  700: const Color.fromRGBO(215, 224, 217, .8),
  800: const Color.fromRGBO(215, 224, 217, .9),
  900: const Color.fromRGBO(215, 224, 217, 1),
};

// 0xFF33363F #33363F
Map<int, Color> swatchColor = {
  50: const Color.fromRGBO(51, 54, 63, .1),
  100: const Color.fromRGBO(51, 54, 63, .2),
  200: const Color.fromRGBO(51, 54, 63, .3),
  300: const Color.fromRGBO(51, 54, 63, .4),
  400: const Color.fromRGBO(51, 54, 63, .5),
  500: const Color.fromRGBO(51, 54, 63, .6),
  600: const Color.fromRGBO(51, 54, 63, .7),
  700: const Color.fromRGBO(51, 54, 63, .8),
  800: const Color.fromRGBO(51, 54, 63, .9),
  900: const Color.fromRGBO(51, 54, 63, 1),
};
// 0xFFEAC1A2 #EAC1A2
Map<int, Color> color2 = {
  50: const Color.fromRGBO(234, 193, 162, .1),
  100: const Color.fromRGBO(234, 193, 162, .2),
  200: const Color.fromRGBO(234, 193, 162, .3),
  300: const Color.fromRGBO(234, 193, 162, .4),
  400: const Color.fromRGBO(234, 193, 162, .5),
  500: const Color.fromRGBO(234, 193, 162, .6),
  600: const Color.fromRGBO(234, 193, 162, .7),
  700: const Color.fromRGBO(234, 193, 162, .8),
  800: const Color.fromRGBO(234, 193, 162, .9),
  900: const Color.fromRGBO(234, 193, 162, 1),
};


MaterialColor primaryColor = MaterialColor(0xFFB24F44, color0);
MaterialColor secondaryColor = MaterialColor(0xFF33363F, color1);
MaterialColor tertiairColor = MaterialColor(0xFFEAC1A2, color2);
MaterialColor blackColor = MaterialColor(0xFF33363F, swatchColor);
Color greenColor = const Color(0xFF43675F);
Color orangeColor = const Color(0xFFEC653C);
Color yellowColor = const Color(0xFFFDCF76);
Color pinkColor = const Color(0xFFF1AEC7);
Color indigoColor = const Color(0xFFA493C6);
Color LightndigoColor = const Color(0xFF55448B);
double PADDING = 10;
double RADIUS = 12;
const String boxSettings = 'settings';



final List<Map<String, dynamic>> ButtomNavigationList = [
  {
    'label': 'ACCUEIL',
    'icon': Icons.church,
  },
  {
    'label': 'DEMANDER',
    'icon': Icons.handshake_outlined,
  },
  {
    
    'label': 'PANIER',
    'icon': Icons.shopping_cart,
  },
  {
    
    'label': 'PARAMÈTRES',
    'icon': Icons.settings,
  },
];
final List<Map<String, dynamic>> demandeList = [
  {
    'date': 'DIM. 7 AVRIL - 11H',
    'communaute': 'Saint Jean-Baptiste',
    'adresse': 'Morokro',
    'intention': 'Action de grâce',
    'motif': 'Pour l’anniversaire Franck et Lise',
  },
  {
    'date': 'SAM. 6 AVRIL - 19H',
    'communaute': 'Notre Dame de l’Incarnation',
    'adresse': 'Abidjan Riviera Palmeraie',
    'intention': 'Repos de l’âme',
    'motif': 'Pour le bien-aimé Alfred',
  },
   {
    'date': 'DIM. 7 AVRIL - 11H',
    'communaute': 'Notre Dame des Apotre',
    'adresse': 'Divo',
    'intention': 'Action de grâce',
    'motif': 'Pour l’anniversaire de Franck le jour de ses 30 ans afin que le Seigneur lui accorde une encore plus longue vie.',
  },
  {
    'date': 'VEN. 5 AVRIL - 19H',
    'communaute': 'Saint Jean-Baptiste',
    'adresse': 'Morokro',
    'intention': 'Assistance et Protection',
    'motif': 'Pour la maladie de Serges',
  },
  {
    'date': 'DIM. 7 AVRIL - 11H',
    'communaute': 'Saint Jean-Baptiste',
    'adresse': 'Morokro',
    'intention': 'Action de grâce',
    'motif': 'Pour l’anniversaire de mes petits enfants Franck et Lise',
  },
 
 
];



final List<Map<String, dynamic>> egliseList = [
 {
  'eglise': 'Saint Jean-Baptiste',
   'adresse': 'Abidjan Riviera Palmeraie',
   'date':[
    {'hour':'8:00'},
    {'hour':'10:30'}
   ],
  },
  {
    'eglise': 'Notre Dame de l\'Incarnation',
    'adresse': 'Morokro',
    'date':[
    {'hour':'6:30'},
    {'hour':'8:00'},
    {'hour':'9:30'},
    {'hour':'11:00'},
    {'hour':'19:00'},
    ]
  },
  {
    
    'eglise': 'Saint Ambroise Jubilé',
    'adresse': 'Abidjan Angré',
    'date':[
    {'hour':'6:30'},
    {'hour':'8:00'},
    {'hour':'9:30',}
    ]
  },
];


final List<Map<String, dynamic>> intentionCategories = [ 
    {'value': 'Étudiant', "key": "STUDENT"},
    {
      'value': 'Action de grâce',
      "key": "ACTION_GRACE"
    },
    {
      'value': 'Repos de l’âme',
      "key": "REPOS_AME"
    },
    {
      'value': 'Assistance et Protection',
      "key": "ASSISTANT_PROTECTION"
    },
    {
      'value': 'Reveil Spirituel',
      "key": "REVEIL_SPIRITUEL"
    },
    
    
  ];
final List<Map<String, dynamic>> indicatifContries = [ 
    {'value': '+225', "key": ""},
    {
      'value': '+237',
      "key": ""
    },
    {
      'value': '+224',
      "key": ""
    },
    {
      'value': '+228',
      "key": ""
    },
    {
      'value': '+242',
      "key": ""
    },
    
    
  ];


  final List<Map<String, dynamic>> colorItems = [ 
    {'backColor': indigoColor,
     "fontColor": pinkColor
     },
    {
      'backColor': orangeColor,
      "fontColor": primaryColor
    },
    {
      'backColor': tertiairColor,
      "fontColor": greenColor
    },
  ];
  final List<Map<String, dynamic>> offeringItems = [ 

    {'type': "Une Messe",
     "price": "3.000"
     },
    {
      'type': "Une Neuvaine (9 jours)",
      "price": "27.000"
    },
    {
      'type': "Un Trentain (30 jours)",
      "price": "90.000"
    },
  ];
