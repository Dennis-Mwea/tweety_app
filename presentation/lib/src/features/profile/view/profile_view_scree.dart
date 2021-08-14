import 'package:core/core/core_screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/features/profile/view/profile_view_view_model.dart';

class ProfileViewScreen extends CoreScreen<ProfileViewViewModel> {
  // const ProfileViewScreenRoute({this.username});

  final String username;

  ProfileViewScreen(this.username);

  @override
  Widget builder(BuildContext context, ProfileViewViewModel viewModel, Widget? child) {
    return Scaffold();
  }

  @override
  ProfileViewViewModel viewModelBuilder(BuildContext context) => ProfileViewViewModel();
}
