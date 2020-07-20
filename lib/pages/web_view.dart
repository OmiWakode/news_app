import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebView extends StatefulWidget {

  final String url;
  final String title;

  const WebView(this.url, this.title);


  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: BackButton(
        ),

      ),
      body: SafeArea(
        child: new Column(
          children: <Widget>[
            MaterialApp(
              routes: {
                "/": (_) => new WebviewScaffold(
                  url: widget.url
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}
