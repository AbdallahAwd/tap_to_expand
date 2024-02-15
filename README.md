<img src="https://img.shields.io/pub/v/shared_preferences.svg" alt="pub package">
This package is to build expandable widget fast and easy with few lines and you can customize it to whatever!

## Features

- include your content easily
- you can make it scroll by setting scrollable to true
- some beautiful animation

## Getting started

<p>To use this plugin, add <code>tap_to_expand</code> as a <a href="https://flutter.dev/docs/development/platform-integration/platform-channels">dependency in your pubspec.yaml file</a>.</p>

<br>

<div>
<img src="/tap_to_expand.gif" width="300px" height="700px">
<img src="/tap_to_ex_letter.gif" width="300px" height="700px">
</div>


## Usage

Here is How to use <strong>TapToExpand</strong> class, You can find Package Api <a href = "https://github.com/AbdallahAwd/tap_to_expand">HERE</a>

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


Here is How to use <strong>TapToExpandLetter</strong> class, You can find Package Api <a href = "https://github.com/AbdallahAwd/tap_to_expand">HERE</a>

```dart
TapToExpandLetter(
                // autoClose: false, default is true
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
                    //   'assets/image_ex.png',
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
```
<a href="https://www.buymeacoffee.com/abdallah4"> <img src="https://play-lh.googleusercontent.com/aMb_Qiolzkq8OxtQZ3Af2j8Zsp-ZZcNetR9O4xSjxH94gMA5c5gpRVbpg-3f_0L7vlo" width="100px" /></a>
