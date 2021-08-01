import 'package:core/core/core_screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/di/locator.dart';
import 'package:presentation/src/features/notifications/notifications_view_model.dart';

class NotificationsScreen extends CoreScreen<NotificationsViewModel> {
  final GlobalKey<ScaffoldState> scaffoldKey;

  NotificationsScreen({required this.scaffoldKey});

  @override
  Widget builder(BuildContext context, NotificationsViewModel viewModel, Widget? child) {
    return Scaffold(body: Center(child: Text('Notifications Page')));
  }

  @override
  NotificationsViewModel viewModelBuilder(BuildContext context) => locator<NotificationsViewModel>();
}
