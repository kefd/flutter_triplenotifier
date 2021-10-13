import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Future<void> get loading async => Timer(
      const Duration(seconds: 5), () => QR.navigator.replaceAll('/initial'));

  @override
  void initState() {
    super.initState();
    loading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/logo.png'))
    );
  }
}
