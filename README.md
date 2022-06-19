<img src="https://img.shields.io/pub/v/shared_preferences.svg" alt="pub package">
This package is to build expandable widget fast and easy with few lines and you can customize it to whatever!

## Features

- include your content easliy
- you can make it scroll by setting scrollable to true
- some beautiful animation

## Getting started

<p>To use this plugin, add <code>tap_to_expand</code> as a <a href="https://flutter.dev/docs/development/platform-integration/platform-channels">dependency in your pubspec.yaml file</a>.</p>

<br>
<img src="https://media1.tenor.com/images/c9060d0363547d42218520c4c0061bb4/tenor.gif?itemid=25995791" width = "300px">

## Usage

Here is How to use it, You can find Package <a href = "https://github.com/AbdallahAwd/tap_to_expand">API</a>

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
