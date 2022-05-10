```dart
import 'package:tap_to_expand/tap_to_expand.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TapToExpand Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: TapToExpand(
          content: Column(
            children: <Widget>[
              for (var i = 0; i < 20; i++)
                Text(
                  "data $i",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
            ],
          ),
          title: const Text(
            'TapToExpand',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onTapPadding: 10,
          closedHeight: 70,
          scrollable: true,
          borderRadius: 10,
          openedHeight: 200,
        ),
      ),
    );
  }
}
```
