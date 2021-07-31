import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DialogService {
  final StackRouter _router;

  DialogService(this._router);

  BuildContext _getSafeContext() {
    final context = _router.navigatorKey.currentContext;

    return context != null ? context : throw ('Have you forgotten to setup routes?');
  }

  Future<OkCancelResult> error({required String title, required String message}) =>
      showOkAlertDialog(context: _getSafeContext(), title: title, message: message);

  Future<OkCancelResult> ast(
          {required String title, required String message, required String positiveButton, required String cancelButton}) =>
      showOkCancelAlertDialog(
          context: _getSafeContext(), title: title, message: message, okLabel: positiveButton, cancelLabel: cancelButton);
}
