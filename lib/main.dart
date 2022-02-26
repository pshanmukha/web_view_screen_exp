import 'package:flutter/material.dart';
import 'package:webview_exp/webview_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Web View Exp"),
        ),
        body: Center(
          child: TextButton(
            child: Text("Wev View"),
            onPressed: () {
              Navigator.push(
                  context,
                   MaterialPageRoute(
                      builder: (BuildContext context) => WebViewScreen()));
            },
          ),
        ));
  }
}
