import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({Key? key, this.boxColor, required this.title, this.icon, this.iconColor, this.onTap}) : super(key: key);

  final Color? boxColor;
  final String title;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: boxColor, borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(icon, color: iconColor, size: 30.0),
              SizedBox(width: 20.0),
              Text(title, style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 18.0))
            ],
          ),
        ),
      ),
    );
  }
}
