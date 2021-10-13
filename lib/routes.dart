import 'package:qlevar_router/qlevar_router.dart';
import 'package:triple_example/ui/pages/authentication/login_valuenotifier_page.dart';
import 'package:triple_example/ui/pages/authentication/register_valuenotifier_page.dart';
import 'package:triple_example/ui/pages/authentication/login_triplenotifier_page.dart';
import 'package:triple_example/ui/pages/authentication/register_triplenotifier_page.dart';
import 'package:triple_example/ui/pages/books/book_details_page.dart';
import 'package:triple_example/ui/pages/books/books_list_page.dart';
import 'package:triple_example/ui/pages/counters/counter_triplenotifier_page.dart';
import 'package:triple_example/ui/pages/initial_page.dart';
import 'package:triple_example/ui/pages/counters/counter2_triplenotifier_page.dart';
import 'package:triple_example/ui/pages/splashscreen_page.dart';
import 'package:triple_example/ui/pages/unknown_page.dart';

import 'model/book_model.dart';

final List<QRoute> routes = <QRoute>[
  QRoute(path: '/', builder: () => const SplashScreenPage()),
  QR.settings.notFoundPage =
      QRoute(path: '/404', builder: () => const UnknownPage()),
  QRoute(
      path: '/initial',
      builder: () => const InitialPage(title: 'página inicial')),
  QRoute(
      path: '/countertriplenotifier', builder: () => const CounterTripleNotifierPage(title: 'Concatenadora Triple Notifier')),
  QRoute(
      path: '/counter2triplenotifier', builder: () => const Counter2TripleNotifierPage(title: 'Concatenadora Triple Notifier')),
  QRoute(path: '/books', builder: () => BooksListPage(title: 'books')),
  QRoute(
      path: '/book/:id((^[0-9]\$))',
      builder: () {
        QR.params['book']!.keepAlive = false;
        return BookDetailsPage(book: QR.params['book']!.valueAs<BookModel>());
      }),
  QRoute(path: '/loginvaluenotifier', builder: () => LoginValueNotifierPage()),
  QRoute(path: '/signupvaluenotifier', builder: () => RegisterValueNotifierPage()),
  QRoute(path: '/logintriplenotifier', builder: () => LoginTripleNotifierPage()),
  QRoute(path: '/signuptriplenotifier', builder: () => RegisterTripleNotifierPage())
];
