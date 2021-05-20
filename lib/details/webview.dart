import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewContainer extends StatefulWidget {
  final url; 
  WebViewContainer(this.url);

  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {

  var _url;
  bool isLoading=true;
  final _key = UniqueKey();  

  _WebViewContainerState(this._url);

  Widget build(BuildContext context) {
    // if (Platform.isAndroid) Webview.platform = SurfaceAndroidWebView();

    return Scaffold(
      body: Stack(
        children: [
          WebView(
            key: _key, 
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: _url,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? Center(child: Text('Loading your chosen city. Please wait..'),): Stack(),
        ],
      ),
    );
  }
}
