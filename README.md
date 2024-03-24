<a href="https://thebsd.github.io/StandWithPalestine/">![anouncement](https://raw.githubusercontent.com/TheBSD/StandWithPalestine/main/banner-no-action.svg)</a>
![pub package](https://img.shields.io/pub/v/shared_preferences.svg)

This package provides an easy and fast way to build expandable widgets with minimal code. You can customize these widgets according to your needs.

## Features

- Easily include your content
- Enable scrolling with the `isScrollable` parameter
- Beautiful animations

## Getting started

To use this plugin, add `tap_to_expand` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  tap_to_expand: ^1.0.0
```

<br>

<div>
<img src="https://i.postimg.cc/gddQ0GzK/Untitled-Project2024-03-2414-03-57-ezgif-com-video-to-gif-converter.gif" width="300px" height="550px">
<img src="https://i.postimg.cc/Bn0smwyK/tap-to-ex-letter.gif" width="300px" height="700px">
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

For more information and customization options, visit the <a href="https://github.com/AbdallahAwd/tap_to_expand">TapToExpand GitHub repository.</a>

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
