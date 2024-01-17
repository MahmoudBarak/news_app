import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {

  final  String url;

const WebViewScreen({super.key,required this.url});

  @override
  Widget build(BuildContext context) {
 final    controller = WebViewController()..setJavaScriptMode(JavaScriptMode.disabled)..loadRequest(Uri.parse(url));
    
    return  Scaffold(
      appBar: AppBar(),
      body:WebViewWidget(controller:controller ,),
    );
  }

}
