import 'package:core/core/core_screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/di/locator.dart';
import 'package:presentation/src/features/explore/explore_view_model.dart';

class ExploreScreen extends CoreScreen<ExploreViewModel> {
  final GlobalKey<ScaffoldState> scaffoldKey;

  ExploreScreen({required this.scaffoldKey});

  @override
  Widget builder(BuildContext context, ExploreViewModel viewModel, Widget? child) {
    return Scaffold(body: Center(child: Text('Explore Page')));
  }

  @override
  ExploreViewModel viewModelBuilder(BuildContext context) => locator<ExploreViewModel>();
}
