```dart
import 'package:flutter/material.dart';
import 'package:untitled/Tap%20to%20Expand/tap_to_expand.dart';

class TaptoExpandLetterHome extends StatefulWidget {
  const TaptoExpandLetterHome({Key? key}) : super(key: key);

  @override
  State createState() => _TaptoExpandLetterHomeState();
}

class _TaptoExpandLetterHomeState extends State<TaptoExpandLetterHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TaptoExpandLetter(
                  content: Text(
                    'Feel free to use the code in your projects but do not forget to give me the credits adding  (Flutter Animation Gallery) where you are gonna use it.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  title: Text(
                    'Tap to Expand',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  height: 125,
                  // bottomPadding: 1,
                  width: 125,
                  centerWidget: Icon(
                    Icons.expand_less_rounded,
                    size: 50,
                    // color: Colors.blue,
                  ),
                ),
                TaptoExpandLetter(
                  content: Text(
                    'Feel free to use the code in your projects but do not forget to give me the credits adding (Flutter Animation Gallery) where you are gonna use it.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  title: Text(
                    'Tap to Expand',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  height: 125,
                  // bottomPadding: 1,
                  width: 125,
                  centerWidget: Icon(
                    Icons.expand_less_rounded,
                    size: 50,
                    // color: Colors.blue,
                  ),
                ),
              ],
            ),
            TaptoExpandLetter(
                // autoClose: false,
                title: const Text(
                  'Tap to Expand',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                content: Column(
                  children: const [
                    Text(
                      'Feel free to use the code in your projects but do not forget to give me the credits adding  (Flutter Animation Gallery) where you are gonna use it.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Image.asset(
                    //   'assets/paypal.png',
                    //   width: 150,
                    //   height: 150,
                    // ),
                  ],
                ),
                centerWidget: const Icon(
                  Icons.expand_less_rounded,
                  size: 50,
                ))
          ],
        ),
      ),
    );
  }
}

```