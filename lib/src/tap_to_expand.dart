import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class TapToExpand extends StatefulWidget {
  /// A widget that represents a TapToExpand widget.
  ///
  /// This widget is used to create a customizable expandable widget.
  /// It has the ability to customize its width, height, padding,
  /// curve, duration, and more.
  ///
  /// The [width] parameter is used to define the width of the widget.
  /// The [titlePadding] parameter is used to define the padding of the title.
  /// The [paddingCurve] parameter is used to define the curve of the padding animation.
  /// The [duration] parameter is used to define the duration of the expand animation.
  /// The [closedHeight] parameter is used to define the height of the widget when it's closed.
  /// The [openedHeight] parameter is used to define the height of the widget when it's opened.
  /// The [backgroundcolor] parameter is used to define the background color of the widget.
  /// The [borderRadius] parameter is used to define the border radius of the widget.
  /// The [title] parameter is used to define the title of the widget.
  /// The [content] parameter is used to define the content of the widget.
  /// The [iconColor] parameter is used to define the color of the icon.
  /// The [iconSize] parameter is used to define the size of the icon.
  /// The [spaceBetweenBodyTitle] parameter is used to define the space between the body and the title.
  /// The [isScrollable] parameter is used to define whether the widget is scrollable or not.
  /// The [outerClosedPadding] parameter is used to define the padding of the widget when it's closed.
  /// The [outerOpenedPadding] parameter is used to define the padding of the widget when it's opened.
  /// The [curve] parameter is used to define the curve of the expand animation.
  const TapToExpand({
    super.key,
    this.width,
    this.titlePadding,
    this.paddingCurve,
    this.duration = const Duration(milliseconds: 500),
    this.closedHeight,
    this.openedHeight,
    this.backgroundcolor,
    this.borderRadius,
    required this.title,
    required this.content,
    this.iconColor,
    this.iconSize,
    this.spaceBetweenBodyTitle,
    this.isScrollable = false,
    this.outerClosedPadding,
    this.outerOpenedPadding,
    this.curve,
  });

  final Widget title;
  final Widget content;
  final double? width;
  final double? closedHeight;
  final double? spaceBetweenBodyTitle;
  final double? openedHeight;
  final EdgeInsets? titlePadding;
  final double? outerClosedPadding;
  final double? outerOpenedPadding;
  final Curve? paddingCurve;
  final Curve? curve;
  final Duration duration;
  final Color? backgroundcolor;
  final Color? iconColor;
  final double? iconSize;
  final BorderRadius? borderRadius;
  final bool isScrollable;

  @override
  State<TapToExpand> createState() => _TapToExpandState();
}

class _TapToExpandState extends State<TapToExpand>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> containerAnimation;
  late Animation<double> rotateAnimation;
  late Animation paddingAnimation;
  late Animation<double> fadeAnimation;
  bool isLoading = false;

  /// Initialize the state of the [_TapToExpandState].
  ///
  /// This function initializes the [AnimationController], [containerAnimation],
  /// [rotateAnimation], [paddingAnimation], and [fadeAnimation].
  /// It sets up the animation controller, and the different animations.
  /// The animations are used to control the size, rotation, padding,
  /// and fade of the widget.
  @override
  void initState() {
    super.initState();

    // Initializes the animation controller.
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addListener(() {
        setState(() {});
      });

    // Initializes the animation for the container height.
    containerAnimation = Tween<double>(
            begin: widget.closedHeight ?? 70, end: widget.openedHeight ?? 250)
        .animate(CurvedAnimation(
            parent: animationController, curve: widget.curve ?? Curves.ease))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        log(status.toString());
      });

    // Initializes the animation for the rotation of the icon.
    rotateAnimation =
        Tween<double>(begin: 0, end: math.pi).animate(animationController);

    // Initializes the animation for the padding of the widget.
    paddingAnimation = Tween<double>(
            begin: widget.outerClosedPadding ?? 20,
            end: widget.outerOpenedPadding ?? 10)
        .animate(CurvedAnimation(
            parent: animationController,
            curve: widget.paddingCurve ?? Curves.bounceInOut));

    // Initializes the animation for the fade of the widget.
    fadeAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
  }

  @override
  void dispose() {
    // Dispose of the animation controller when the widget is removed from the widget tree.
    // This is necessary to avoid memory leaks.
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Sets the width of the container to the width of the device if it is not specified in the widget.
      // Otherwise, it sets the width to the width specified in the widget.
      width: widget.width ?? MediaQuery.sizeOf(context).width,

      // Sets the height of the container based on the animation value of containerAnimation.
      // If isScrollable is true, the height is determined by the containerAnimation.
      // If isScrollable is false and the animationController is animating, the height is determined by the containerAnimation.
      // Otherwise, it sets the height to null.
      height: widget.isScrollable == true
          ? containerAnimation.value
          : animationController.isAnimating
              ? containerAnimation.value
              : null,

      // Sets the padding of the container based on the padding specified in the widget.
      // If no padding is specified, it sets padding to a symmetrical EdgeInsets with horizontal padding of 20 and vertical padding of 20.
      padding: widget.titlePadding ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

      // Sets the margin of the container based on the value of paddingAnimation.
      margin: EdgeInsets.symmetric(horizontal: paddingAnimation.value),

      // Sets the decoration of the container to a BoxDecoration with the specified properties.
      // If no background color is specified, it sets the color to the primary color of the theme.
      // It also sets a box shadow to give a 3D effect to the container.
      // If no border radius is specified, it sets the border radius to a circular border radius of 12.
      decoration: BoxDecoration(
        color: widget.backgroundcolor ?? Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
      ),

      // Sets the child of the container to a ListView.
      // This allows the container to have multiple children and scroll vertically.
      child: ListView(
        physics: widget.isScrollable
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        shrinkWrap: widget.isScrollable ? false : true,
        children: [
          InkWell(
            onTap: () {
              // If the animation is dismissed, i.e., the container is in its closed state,
              // it sets isLoading to true and forwards the animation, showing the
              // container in its open state. If the animation is not dismissed, it
              // reverses the animation, showing the container in its closed state.
              if (animationController.isDismissed) {
                setState(() {
                  isLoading = !isLoading;
                });
                animationController.forward();
              } else {
                animationController.reverse();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.title,
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: rotateAnimation.value,
                      child: Icon(
                        Icons.expand_more,
                        color: widget.iconColor ?? Colors.white,
                        size: widget.iconSize ?? 25,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // This widget is displayed when the animation is not dismissed, i.e.,
          // when the container is in its open state. It provides a GestureDetector
          // on top of the Column widget, which contains a SizedBox and a FadeTransition
          // widget. The GestureDetector is used to detect taps on the widget and
          // toggle the animation and the state of isLoading. The Column widget contains
          // a SizedBox to introduce some space between the widget's title and its
          // content, and a FadeTransition widget, which gradually fades in the
          // widget's content.
          if (!animationController.isDismissed)
            GestureDetector(
              // This function is called when the widget is tapped. It toggles the
              // animation and the state of isLoading.
              onTap: () {
                animationController.isCompleted
                    ? animationController.reverse()
                    : animationController.forward();
                setState(() {
                  isLoading = !isLoading;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // This widget introduces space between the widget's title and its
                  // content. The height is specified by the spaceBetweenBodyTitle
                  // property of the widget.
                  SizedBox(
                    height: widget.spaceBetweenBodyTitle ?? 20,
                  ),
                  // This widget fades in the widget's content gradually. The
                  // opacity is controlled by the fadeAnimation.
                  FadeTransition(opacity: fadeAnimation, child: widget.content),
                ],
              ),
            )
        ],
      ),
    );
  }
}
