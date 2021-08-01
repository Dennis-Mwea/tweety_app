import 'dart:convert';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class AvatarButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  AvatarButton({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserModel.fromJson(json.decode(SharedObjects.prefs.getString(Constants.user)!));

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () => scaffoldKey.currentState!.openDrawer(),
        child: CircleAvatar(radius: 15.0, backgroundColor: Theme.of(context).cardColor, backgroundImage: NetworkImage(user.avatar)),
      ),
    );
  }
}
