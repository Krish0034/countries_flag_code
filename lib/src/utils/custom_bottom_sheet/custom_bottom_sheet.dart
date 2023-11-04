
import 'package:countries_flag_code/src/utils/colors_file.dart';
import 'package:countries_flag_code/src/utils/custom_widgets/hw_space.dart';
import 'package:countries_flag_code/src/utils/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> customBottomSheet(BuildContext context,
    {String? headerTitle,
    bool titleIsRequired = true,
    Widget? bodyWidgets,
    Widget? subtitle,
    Axis bodyScrollDirection = Axis.vertical,
    Color backgroundColor = ColorFiles.whiteColor,
    double? maxHeight,
    double? bottomSheetWidth,
    double? bottomSheetLeftPadding,
    double? bottomSheetRightPadding,
    double? bottomSheetTopPadding,
    double? bottomSheetbottomPadding,
    double? topSpacing,
    bool isDismissible = true,
    bool viewInsetsbottomEnable = true,
    bool scrollableViewInsetsbottomEnable = true,
    bool isDraggable = true,
    bool isScrolled = true,
    double? topLeftRadius,
    double? topRightRadius,
    double? appBarHeight = 80.0,
    double? bottomLeftRadius,
    double? bottomRightRadius,
    Widget? backIcon,
    Widget? headerWidget,
    Function()? onTap,
    bool v = false,
    bool headerTitleRequired = true,
    Widget? widget}) async {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius ?? 20.r),
          topRight: Radius.circular(topRightRadius ?? 20.r),
          bottomLeft: Radius.circular(bottomLeftRadius ?? 20.r),
          bottomRight: Radius.circular(bottomRightRadius ?? 20.r),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: ColorFiles.transparent,
      context: context,
      enableDrag: isDraggable,
      isDismissible: isDismissible,
      builder: (BuildContext context) {
        return Container(
            color: ColorFiles.transparent,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(
                left: bottomSheetLeftPadding ?? 20.r,
                right: bottomSheetRightPadding ?? 20.r,
                bottom: bottomSheetbottomPadding ?? 50.r,
                top: bottomSheetTopPadding ?? 50.r),
            child: Container(
              width: bottomSheetWidth ?? MediaQuery.of(context).size.width,
              height: maxHeight ?? MediaQuery.of(context).size.height - 100.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(topLeftRadius ?? 20.r),
                    topRight: Radius.circular(topRightRadius ?? 20.r),
                    bottomLeft: Radius.circular(bottomLeftRadius ?? 20.r),
                    bottomRight: Radius.circular(bottomRightRadius ?? 20.r),
                  )),
              child: Scaffold(
                backgroundColor: ColorFiles.transparent,
                body: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 12),
                          child: Center(
                            child: Container(
                              height: 4,
                              width: 96,
                              decoration: BoxDecoration(
                                color: ColorFiles.appBarText,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        if (titleIsRequired)
                          hwSpace(height: 10.h)
                        else
                          hwSpace(height: 20.h),
                        if (titleIsRequired)
                          TextWidget(headerTitle!)
                        else
                          hwSpace(height: 00.h),
                        headerWidget ?? const SizedBox.shrink()
                      ],
                    ),
                    Positioned(
                      top: appBarHeight,
                      left: 0.0,
                      bottom: 0.0,
                      right: 0.0,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(bottomLeftRadius ?? 20.r),
                                  bottomRight: Radius.circular(
                                      bottomRightRadius ?? 20.r),
                                ),
                              ),
                              child: bodyWidgets ?? Container(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],

                  // Positioned(child: bodyWidgets ?? Container()),
                ),
              ),
            ));
      });
}
