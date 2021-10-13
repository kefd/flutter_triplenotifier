import 'package:triple_example/data/provider/book_provider.dart';
import 'package:triple_example/model/book_model.dart';

class BooksRepository {
  static Future<List<BookModel>> get getAll => Future.value(books);
}
