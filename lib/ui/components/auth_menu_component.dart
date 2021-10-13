import 'package:flutter/material.dart';
import 'package:triple_example/ui/widgets/bottom_menu.dart';

List<String> _loginRoutes = <String>[
  '/loginvaluenotifier',
  '/signupvaluenotifier',
  '/logintriplenotifier',
  '/signuptriplenotifier',
];

List<Map<String, dynamic>> _authBottomNavigationBarItem =
    <Map<String, dynamic>>[
      { 'label': 'Login Value Notifier', 'icon': const Icon(Icons.login) },
      { 'label': 'Sign up Value Notifier', 'icon': const Icon(Icons.app_registration) },
      { 'label': 'Login Triple Notifier', 'icon': const Icon(Icons.login) },
      { 'label': 'Sign up Triple Notifier', 'icon': const Icon(Icons.app_registration) }
    ];

BottomNavigationBar authMenu(int index) => bottomMenu(index, _loginRoutes, _authBottomNavigationBarItem);
