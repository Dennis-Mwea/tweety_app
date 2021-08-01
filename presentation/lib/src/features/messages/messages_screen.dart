import 'package:core/core/core_screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/di/locator.dart';
import 'package:presentation/src/features/messages/messages_view_model.dart';

class MessagesScreen extends CoreScreen<MessagesViewModel> {
  final GlobalKey<ScaffoldState> scaffoldKey;

  MessagesScreen({required this.scaffoldKey});

  @override
  Widget builder(BuildContext context, MessagesViewModel viewModel, Widget? child) {
    return Scaffold(body: Center(child: Text('Messages Page')));
  }

  @override
  MessagesViewModel viewModelBuilder(BuildContext context) => locator<MessagesViewModel>();
}
