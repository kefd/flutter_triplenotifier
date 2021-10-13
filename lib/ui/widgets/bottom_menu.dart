import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

BottomNavigationBar bottomMenu(int index, List<String> menuRoutes,
        List<Map<String, dynamic>> menuBottomNavigationBarItem) =>
    BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          for (var menuItem in menuBottomNavigationBarItem)
            BottomNavigationBarItem(
                icon: menuItem['icon'], label: menuItem['label'])
        ],
        currentIndex: index,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) => QR.to(menuRoutes[index]));
