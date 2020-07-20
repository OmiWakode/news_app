import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';




class WebNews extends StatefulWidget {

  final String url;
  final String title;

  const WebNews(this.url, this.title);
  @override
  _WebNewsState createState() => _WebNewsState();
}

class _WebNewsState extends State<WebNews> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          leading: BackButton(
          ),

        ),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,

        )



    );
  }
}

