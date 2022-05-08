import 'package:flutter/material.dart';

class TapToExpand extends StatefulWidget {
  final Widget content;
  final Widget title;
  final Widget? trailing;
  final Color? color;
  final Color? shadowColor;
  final bool? scrollable;
  final double? closedHeight;
  final double? openedHeight;
  final Duration? duration;
  final double? onTapPadding;
  final double? borderRadius;
  final ScrollPhysics? scrollPhysics;

  const TapToExpand({
    Key? key,
    required this.content,
    required this.title,
    this.color,
    this.scrollable,
    this.closedHeight,
    this.openedHeight,
    this.shadowColor,
    this.duration,
    this.onTapPadding,
    this.borderRadius,
    this.scrollPhysics,
    this.trailing,
  }) : super(key: key);
  @override
  _TapToExpandState createState() => _TapToExpandState();
}

class _TapToExpandState extends State<TapToExpand> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    bool scrollable = widget.scrollable ?? false;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
          horizontal: isExpanded ? 25 : widget.onTapPadding ?? 10,
          vertical: 5,
        ),
        padding: const EdgeInsets.all(20),
        height:
            isExpanded ? widget.closedHeight ?? 70 : widget.openedHeight ?? 240,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: widget.duration ?? const Duration(milliseconds: 1200),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: widget.shadowColor ?? Colors.grey,
              blurRadius: 20,
              offset: const Offset(5, 10),
            ),
          ],
          color: widget.color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(isExpanded ? widget.borderRadius ?? 10 : 5),
          ),
        ),
        child: scrollable
            ? ListView(
                physics: widget.scrollPhysics,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.title,
                      widget.trailing ??
                          Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: Colors.white,
                            size: 27,
                          ),
                    ],
                  ),
                  isExpanded ? const SizedBox() : const SizedBox(height: 20),
                  AnimatedCrossFade(
                    firstChild: const Text(
                      '',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),
                    secondChild: widget.content,
                    crossFadeState: isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration:
                        widget.duration ?? const Duration(milliseconds: 1200),
                    reverseDuration: Duration.zero,
                    sizeCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.title,
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 27,
                      ),
                    ],
                  ),
                  isExpanded ? const SizedBox() : const SizedBox(height: 20),
                  AnimatedCrossFade(
                    firstChild: const Text(
                      '',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),
                    secondChild: widget.content,
                    crossFadeState: isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration:
                        widget.duration ?? const Duration(milliseconds: 1200),
                    reverseDuration: Duration.zero,
                    sizeCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ],
              ),
      ),
    );
  }
}