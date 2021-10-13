import 'package:flutter/cupertino.dart';

enum Status { start, success, loading, error }

mixin Store<State extends Object, SError extends Object> {
  late final ValueNotifier<State> state;
  late final ValueNotifier<Status> _status =
      ValueNotifier<Status>(Status.start);
  late SError _error;

  ValueNotifier<Status> get status => _status;
  SError get error => _error;

  Future<void> exec(Future<void> Function() event) async {
    _status.value = Status.loading;

    try {
      await event();
      _status.value = Status.success;
    } on SError catch (e) {
      _status.value = Status.error;
      _error = e;
    }
  }
}
