import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web View Exp"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.loadUrl('https://www.google.co.in/');
              },
              icon: Icon(Icons.home)),
          IconButton(
              onPressed: () async {
                if (await controller.canGoBack()) {
                  controller.goBack();
                }
              },
              icon: Icon(Icons.arrow_back)),
          IconButton(
              onPressed: () async {
                if (await controller.canGoForward()) {
                  controller.goForward();
                }
              },
              icon: Icon(Icons.arrow_forward)),
          IconButton(
              onPressed: () async {
                controller.reload();
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            color: Colors.black,
          ),
          Expanded(
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://www.google.co.in/',
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
              onProgress: (progress) {
                setState(() {
                  this.progress = progress/100;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
