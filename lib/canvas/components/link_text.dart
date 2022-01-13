import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    Key? key,
    required this.child,
    required this.url,
  }) : super(key: key);

  final Text child;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launch(url),
      child: Text(
        child.data ?? '',
        style: child.style?.copyWith(color: Colors.blue[800]) ??
            TextStyle(color: Colors.blue[800]),
      ),
    );
  }
}
