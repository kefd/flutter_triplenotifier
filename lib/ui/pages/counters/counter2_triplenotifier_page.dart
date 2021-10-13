import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:triple_example/store/counter_triplenotifier_store.dart';
import 'package:triple_example/ui/components/counter_menu_component.dart';

class Counter2TripleNotifierPage extends StatefulWidget {
  final String title;
  const Counter2TripleNotifierPage({Key? key, required this.title})
      : super(key: key);

  @override
  State<Counter2TripleNotifierPage> createState() =>
      _Counter2TripleNotifierPageState();
}

class _Counter2TripleNotifierPageState extends State<Counter2TripleNotifierPage> {
  final CounterTripleNotifierStore _counterTripleNotifierStore =
      CounterTripleNotifierStore();

  @override
  void initState() {
    super.initState();
    _counterTripleNotifierStore.observer(
        onState: (state) => print(state),
        onError: (error) => print(error),
        onLoading: (loading) => print(loading));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.red
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              ScopedBuilder<CounterTripleNotifierStore, Exception, int>(
                  store: _counterTripleNotifierStore,
                  onState: (context, int state) => Text(state.toString(),
                      style: Theme.of(context).textTheme.headline4),
                  onError: (context, Exception? error) =>
                      Text(error.toString()),
                  onLoading: (context) => const CircularProgressIndicator()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: _counterTripleNotifierStore.decrement,
                      icon: const Icon(Icons.remove, color: Colors.red, size: 30.0),
                      label: const Icon(Icons.remove, color: Colors.red, size: 30.0)
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                      onPressed: _counterTripleNotifierStore.increment,
                      icon: const Icon(Icons.add, color: Colors.green, size: 30.0),
                      label: const Icon(Icons.remove, color: Colors.green, size: 30.0))
              ]),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _counterTripleNotifierStore.increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: counterMenu(3));
  }
}
