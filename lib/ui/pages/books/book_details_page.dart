import 'package:flutter/material.dart';
import 'package:triple_example/model/book_model.dart';

class BookDetailsPage extends StatelessWidget {
  final BookModel? book;

  const BookDetailsPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (book != null) ...[
                Text(book!.title, style: Theme.of(context).textTheme.headline6),
                Text(book!.author, style: Theme.of(context).textTheme.subtitle1)
              ]
            ])));
  }
}
