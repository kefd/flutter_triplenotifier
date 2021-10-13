import 'package:flutter/material.dart';
import 'package:triple_example/ui/components/main_menu_component.dart';

class InitialPage extends StatelessWidget {
  final String title;
  const InitialPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(child: Text('Initial page')),
      bottomNavigationBar: mainMenu(0),
    );
  }
}
