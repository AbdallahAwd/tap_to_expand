<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). -->

This package is to build expandable widget fast and easy with few lines and you can customize it to whatever!

## Features

- include your content easliy
- you can make it scroll by setting scrollable to true
- some beautiful animation

## Getting started

You can start using the package by listing it in your tree and set the requires attributes with few lines of code
<img src="https://gcdnb.pbrd.co/images/WhA9wAs9nN4z.gif?o=1">

## Usage

Here is How to use it

```dart
Center(
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
```
