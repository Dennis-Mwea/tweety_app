import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

List<String> parseBody(String body) {
  final RegExp exp = RegExp(r'<a[^>]*>([^<]+)<\/a>');
  var matches = exp.allMatches(body);

  for (var match in matches) {
    body = body.replaceAll(match.group(0)!, match.group(1)!);
  }

  return body.split(" ");
}

TextSpan bodyTextSpan(String body, BuildContext context, TextStyle? style) {
  return TextSpan(
      text: '$body ',
      style: body.trim().startsWith('@') ? style!.copyWith(color: Theme.of(context).primaryColor) : style,
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          if (body.trim().startsWith('@')) {
            // TODO: Redirect to profile page on username click in mentioned body
            Navigator.of(context).pushNamed('/profile', arguments: body.trim().replaceFirst('@', 'to'));
          }
        });
}
