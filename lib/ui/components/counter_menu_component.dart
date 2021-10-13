import 'package:flutter/material.dart';
import 'package:triple_example/ui/widgets/bottom_menu.dart';

List<String> _counterRoutes = <String>[
  '/countervaluenotifier',
  '/counter2valuenotifier',
  '/countertriplenotifier',
  '/counter2triplenotifier',
];

List<Map<String, dynamic>> _counterBottomNavigationBarItem =
    <Map<String, dynamic>>[
      { 'label': 'Value Notifier', 'icon': const Icon(Icons.countertops) },
      { 'label': 'Value Notifier', 'icon': const Icon(Icons.countertops) },
      { 'label': 'Triple Notifier', 'icon': const Icon(Icons.countertops) },
      { 'label': 'Triple Notifier', 'icon': const Icon(Icons.countertops) }
    ];

BottomNavigationBar counterMenu(int index) => bottomMenu(index, _counterRoutes, _counterBottomNavigationBarItem);
