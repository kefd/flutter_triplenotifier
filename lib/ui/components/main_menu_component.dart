import 'package:flutter/material.dart';
import 'package:triple_example/ui/widgets/bottom_menu.dart';

List<String> _mainMenuRoutes = <String>[
  '/initial',
  '/books',
];

List<Map<String, dynamic>> _mainMenuBottomNavigationBarItem =
    <Map<String, dynamic>>[
      { 'label': 'Initial', 'icon': const Icon(Icons.home) },
      { 'label': 'Books', 'icon': const Icon(Icons.book) },
    ];

BottomNavigationBar mainMenu(int index) => bottomMenu(index, _mainMenuRoutes, _mainMenuBottomNavigationBarItem);


