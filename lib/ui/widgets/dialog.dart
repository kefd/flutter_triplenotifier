import 'package:flutter/material.dart';

void dialog(BuildContext context,
        {required String title, required String content}) =>
    showDialog<String>(
        context: context,
        builder: (_) => AlertDialog(
                title: Text(title),
                content: Text(content),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'))
                ]));
