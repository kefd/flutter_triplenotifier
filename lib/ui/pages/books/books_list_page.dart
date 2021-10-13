import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:triple_example/data/repository/books_repository.dart';
import 'package:triple_example/model/book_model.dart';
import 'package:triple_example/store/books_store.dart';
import 'package:triple_example/ui/components/main_menu_component.dart';

class BooksListPage extends StatelessWidget {
  final String title;

  BooksListPage({Key? key, required this.title}) : super(key: key);

  final BooksStore _booksStore = BooksStore(BooksRepository.getAll);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ScopedBuilder<BooksStore, Exception, List<BookModel>>(
          store: _booksStore,
          onLoading: (_) => const Center(child: CircularProgressIndicator()),
          onError: (_, error) => Center(child: Text(error.toString())),
          onState: (_, state) => ListView.builder(
                itemCount: state.length,
                itemBuilder: (_, item) => ListTile(
                  title: Text(state[item].title),
                  subtitle: Text(state[item].author),
                  onTap: () {
                    QR.params.ensureExist('book',
                        initValue: state[item], keepAlive: true);
                    QR.to('/book/${state[item].id}');
                  },
                ),
              )),
      bottomNavigationBar: mainMenu(1),
    );
  }
}
