
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CalculateWidgetSize extends StatefulWidget {
  final Widget child;
  final Function(Size) onChange;

  const CalculateWidgetSize({
    Key? key,
    required this.onChange,
    required this.child,
  }) : super(key: key);

  @override
  CalculateWidgetSizeState createState() => CalculateWidgetSizeState();
}

class CalculateWidgetSizeState extends State<CalculateWidgetSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  var widgetKey = GlobalKey();
  Size? oldSize;

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    var newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onChange(newSize!);
  }
}

//// How to calculate Any Widgit Width and Height?
/// Hieght: ->

/// if your get Error with ltr Direction with then go to link
// https://stackoverflow.com/questions/55740952/error-the-getter-ltr-isnt-defined-for-the-class-textdirection

/*

WidgetSize(
                        onChange: (size) {
                          calculateMaxLines(
                              controllerState.searchResult[0].summaryBullet!
                                  .join('\n\n'),
                              Styles.robotoRegularTextWidgetStyle(
                                size: 16 +
                                    SharedPref.getDouble(SharedPref.fontSize),
                                color: isKidsMode
                                    ? AppTheme.whiteColor
                                    : AppTheme.textLightColor,
                              ),
                              size.width);

                          controllerState.setState(() {
                            controllerState.maxline = (size.height ~/
                                    (16 +
                                        SharedPref.getDouble(
                                            SharedPref.fontSize))) -
                                1;
                          });
                        },
                        child: Expanded(
                          child: RichText(
                            textAlign: TextAlign.start,
                            maxLines: controllerState.maxline,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                children: getSummeryData(
                                    controllerState
                                        .searchResult[0].summaryBullet!,
                                    isKidsMode)),
                          ),
                        ),
                      ),
 */

/// Function 
/// 
/*

int calculateMaxLines(String text, TextStyle textStyle, double maxWidth) {
    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: 999, // A large number to ensure accurate line counting
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: maxWidth);

    final numberOfLines = textPainter.computeLineMetrics().length;
    return numberOfLines;
  }
 */


//// Width:->

/*
WidgetSize(
                        onChange: (size) {
                          controllerState.setState(() {
                            controllerState.maxline = (size.height ~/
                                    (16 +
                                        SharedPref.getDouble(
                                            SharedPref.fontSize))) -
                                2;
                          });
                        },
                        child: Expanded(
                          child: TextWidget(
                            controllerState.searchResult[0].isSummaryApproved ==
                                    false
                                ? controllerState.searchResult[0].content ?? ""
                                : controllerState.searchResult[0].summary ?? "",
                            maxlines: controllerState.maxline,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.robotoRegularTextWidgetStyle(
                              height: 1.3,
                              size: 16 +
                                  SharedPref.getDouble(SharedPref.fontSize),
                              color: AppTheme.textBlackColor,
                            ),
                          ),
                        ),
                      )

*/