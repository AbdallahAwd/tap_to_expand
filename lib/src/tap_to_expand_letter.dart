import 'package:flutter/material.dart';

class TapToExpandLetter extends StatefulWidget {
  /// A nullable Color type.
  final Color? color;

  /// A nullable Color type.
  final Color? backgroundColor;

  /// A variable that is used to store the title of the widget.
  final Text title;

  ///  A variable that is used to set the height of the widget.
  final double? height;

  ///  A variable that is used to set the width of the widget.
  final double? width;

  /// Used to close the widget when the user scrolls down.
  final bool autoClose;

  /// The widget that is displayed in the center of the widget.
  final Widget centerWidget;

  /// A variable that is used to store the content of the widget.
  final Widget content;

  // ignore: use_key_in_widget_constructors
  /// A constructor.
  const TapToExpandLetter({
    Key? key,
    this.color,
    required this.title,
    this.height,
    this.autoClose = true,
    required this.content,
    required this.centerWidget,
    this.backgroundColor,
    this.width,
  }) : super(key: key);

  @override

  /// It creates a state for the widget.
  State createState() => _TapToExpandLetter();
}

class _TapToExpandLetter extends State<TapToExpandLetter> {
  /// Used to control the scroll of the widget.
  final ScrollController _scrollController = ScrollController();

  /// Used to set the top padding of the widget.
  var topPadding = 150.0;

  /// Used to set the bottom padding of the widget.
  var bottomPadding = 0.0;

  /// If the scroll controller has clients, and the offset is greater than 0, set the top padding to 0
  /// and the bottom padding to the offset. Otherwise, set the top padding to 150 and the bottom padding
  /// to 0
  void changePadding() {
    if (_scrollController.hasClients) {
      if (_scrollController.offset > 0) {
        setState(() {
          topPadding = 0.0;
          bottomPadding = _scrollController.offset;
        });
      } else {
        setState(() {
          topPadding = 150.0;
          bottomPadding = 0.0;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    /// Checking if the autoClose variable is true, if it is, it adds a listener to the scroll controller.
    widget.autoClose ? _scrollController.addListener(changePadding) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        /// Used to animate the padding of the widget.
        AnimatedPadding(
          padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          child: CardItem(
            /// Checking if the color variable is null, if it is, it sets the color to the primary color of the
            /// theme.
            color: widget.color ?? Theme.of(context).primaryColor,

            /// Checking if the width variable is null, if it is, it sets the width to the width of the screen.
            width: widget.width ?? MediaQuery.of(context).size.width,

            /// Passing the content of the widget to the CardItem widget.
            content: widget.content,

            /// Setting the height of the widget to 220 if the height variable is null.
            height: widget.height ?? 220,

            /// Passing the title of the widget to the CardItem widget.
            title: widget.title,

            /// Used to control the scroll of the widget.
            scrollController: _scrollController,
            onTap: () {
              setState(() {
                /// Checking if the topPadding is equal to 0, if it is, it sets the topPadding to 150, otherwise, it
                /// sets it to 0.
                topPadding = topPadding == 0 ? 150 : 0.0;

                /// Setting the bottom padding to 150 if the bottom padding is equal to 0, otherwise, it sets it to 0.
                bottomPadding = bottomPadding == 0 ? 150 : 0.0;

                /// Used to animate the scroll controller to the top of the widget.
                _scrollController.position.animateTo(0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              });
            },
          ),
        ),

        /// Used to display the center widget of the widget.
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.only(right: 25, left: 25, top: 200),

            /// Setting the height of the widget to 220 if the height variable is null.
            height: widget.height ?? 220,

            /// Checking if the width variable is null, if it is, it sets the width to the width of the screen.
            width: widget.width ?? MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 30)
              ],

              /// Checking if the backgroundColor variable is null, if it is, it sets the color to the
              /// grey.shade200 color.
              color: widget.backgroundColor ??
                  Colors.grey.shade200.withOpacity(1.0),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: widget.centerWidget,
          ),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final Color color;
  final Text title;
  final double height;
  final double width;
  final Widget content;

  /// Used to control the scroll of the widget.
  final ScrollController scrollController;

  /// A function that is called when the user taps on the widget.
  final VoidCallback onTap;

  /// A constructor.
  const CardItem({
    Key? key,
    required this.scrollController,
    required this.color,
    required this.title,
    required this.height,
    required this.content,
    required this.onTap,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Used to detect the tap of the user on the widget.
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),

        /// Used to add 40 to the height of the widget.
        height: height + 40,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            /// Used to add a shadow to the widget.
            BoxShadow(
                color: const Color(0xffFF6594).withOpacity(0.2),
                blurRadius: 25),
          ],
          color: color.withOpacity(1.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 18.0, left: 15, right: 15, bottom: 15),

          /// Used to control the scroll of the widget.
          child: SingleChildScrollView(
            /// Used to control the scroll of the widget.
            controller: scrollController,

            /// Used to make the scroll bounce when it reaches the top or the bottom of the widget.
            physics: const BouncingScrollPhysics(),

            /// Used to add padding to the content of the widget.
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// A variable that is used to store the title of the widget.
                title,

                /// Used to add a space between the title and the content of the widget.
                const SizedBox(
                  height: 10,
                ),

                /// `content` is a variable that is used to store the content of the widget.
                content,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
