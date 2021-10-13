import 'package:flutter_triple/flutter_triple.dart';
import 'package:triple_example/model/book_model.dart';

class BooksStore extends NotifierStore<Exception, List<BookModel>> {
  Future<void> setBooks(Future<List<BookModel>> bookRepository) async =>
      update(await bookRepository);

  BooksStore(Future<List<BookModel>> bookRepository) : super(<BookModel>[]) {
    setBooks(bookRepository);
  }
}
