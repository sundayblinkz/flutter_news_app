import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(fontSize: 25.0),
            ),
            Text(
              '24',
              style: TextStyle(color: Colors.blue, fontSize: 25.0),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
