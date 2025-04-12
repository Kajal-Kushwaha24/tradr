import 'package:flutter/material.dart';
import 'package:trader/Utils/sizes.dart';

class TradrCustomizeStyle {
  late final Tradr sizes;

  TradrCustomizeStyle() : sizes = Tradr(constraints: null, orientation: null);

  TradrCustomizeStyle.init(BoxConstraints constraints, Orientation orientation)
      : sizes = Tradr(constraints: constraints, orientation: orientation);

  // Text Styles
  Text tradrHeader(
    String text, {
    int? maxLinesOfText,
    Color? textColor,
    double? fontSize,
    TextOverflow? onOverFlow,
    TextAlign? textAlign,
    TextStyle? textStyle,
    FontWeight? fontWeight2,
    bool isLevelTwo = false,
  }) {
    return Text(
      text,
      maxLines: maxLinesOfText,
      overflow: onOverFlow,
      textAlign: textAlign ?? TextAlign.left,
      style: textStyle ??
          headerStyle(
              fontWeight: fontWeight2, color: textColor, size: fontSize),
    );
  }

  Text tradrSubHeader(String text,
      {int? maxLinesOfText,
      Color? textColor,
      double? fontSize,
      TextOverflow? onOverFlow,
      TextAlign? textAlign,
      TextStyle? textStyle}) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: textStyle ?? subHeaderStyle(color: textColor, size: fontSize),
    );
  }

  Text body(String text, {TextAlign? textAlign, TextStyle? textStyle}) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: textStyle ?? bodyStyle(),
    );
  }

  bodyStyle({Color? color, FontWeight? fontWeight, double? fontSize}) {
    return TextStyle(
        fontSize: 2.0 * sizes.textMultiplier,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.bold);
  }

  TextStyle headerStyle({Color? color, FontWeight? fontWeight, double? size}) {
    return TextStyle(
      fontSize: size ?? 2.2 * sizes.textMultiplier,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? Colors.white,
    );
  }

  TextStyle subHeaderStyle(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return TextStyle(
      fontSize: size ?? 1.5 * sizes.textMultiplier,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
    );
  }

  Image tradrImage(String imagePath,
      {double? widthInPercent,
      Key? imageKey,
      double? heightInPercent,
      BoxFit? fitting}) {
    return Image.asset(
      key: imageKey,
      imagePath,
      width: widthInPercent == null
          ? null
          : sizes.horizontalBlockSize * widthInPercent,
      height: heightInPercent == null
          ? null
          : sizes.verticalBlockSize * heightInPercent,
      fit: fitting ?? BoxFit.contain,
    );
  }

  // Button Styles
  Widget tradrElevatedButton({
    required VoidCallback onPressed,
    BorderRadius? borderRadiusOfButton,
    Color? backgroundColor,
    Gradient? gradient,
    double? widthInPercent,
    double? heightInPercent,
    Color? borderColor,
    double? borderWidth,
    required Widget childOfButton,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadiusOfButton ??
            BorderRadius.circular(sizes.horizontalBlockSize * 4),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: Colors.transparent, // Remove shadow if gradient is used
          shape: RoundedRectangleBorder(
            borderRadius: borderRadiusOfButton ??
                BorderRadius.circular(sizes.horizontalBlockSize * 4),
            side: borderColor != null
                ? BorderSide(color: borderColor, width: borderWidth ?? 1)
                : BorderSide.none,
          ),
          minimumSize: widthInPercent != null
              ? Size(
                  sizes.horizontalBlockSize * widthInPercent,
                  sizes.verticalBlockSize * (heightInPercent ?? 6.5),
                )
              : null,
        ),
        onPressed: onPressed,
        child: childOfButton,
      ),
    );
  }

// Icon Styles
  IconButton tradrIconButton(
    IconData iconData, {
    required VoidCallback onPressed, // Click functionality
    Color? color,
    double? sizeOfIcon,
  }) {
    return IconButton(
      icon: tradrIcon(
        iconData,
        color: color,
        sizeOfIcon: sizeOfIcon,
      ),
      onPressed: onPressed,
    );
  }

  Icon tradrIcon(IconData iconData, {Color? color, double? sizeOfIcon}) {
    return Icon(
      iconData,
      size: sizeOfIcon ?? 3.0 * sizes.textMultiplier,
      color: color ?? Colors.white,
    );
  }

  Widget tradrVerticalGap({double? verticalGapSizeInPercent}) {
    return SizedBox(
      height: sizes.getVerticalGapSize(
          verticalGapSizeInPercent:
              verticalGapSizeInPercent ?? sizes.verticalBlockSize),
    );
  }

  Expanded tradrVerticalGapExpanded() {
    return const Expanded(
      child: SizedBox.shrink(),
    );
  }

  Widget tradrHorizontalGap({double? horizontalGapSizeInPercent}) {
    return SizedBox(
      width: sizes.getHorizontalGapSize(
          horizontalGapSizeInPercent:
              horizontalGapSizeInPercent ?? sizes.horizontalBlockSize),
    );
  }

  Widget tradrGapSize(
      {required double horizontalGapSizeInPercent,
      required double verticalGapSizeInPercent}) {
    return SizedBox(
      width: sizes.getHorizontalGapSize(
          horizontalGapSizeInPercent: horizontalGapSizeInPercent),
      height: sizes.getVerticalGapSize(
          verticalGapSizeInPercent: verticalGapSizeInPercent),
    );
  }

  // Padding of all screen
  EdgeInsets tradrAllScreenPadding({double? ver, double? hor}) {
    return EdgeInsets.symmetric(
        horizontal: sizes.horizontalBlockSize * (hor ?? 4),
        vertical: sizes.horizontalBlockSize * (ver ?? 2));
  }

  TextStyle chatStyle(Color? colors) {
    return TextStyle(
      fontSize: 2.0 * sizes.textMultiplier,
      color: colors ?? Colors.white,
    );
  }

  // Margin of all screen
  EdgeInsets tradrTextFieldContainerPadding() {
    return EdgeInsets.symmetric(
        horizontal: sizes.horizontalBlockSize * 4,
        vertical: sizes.horizontalBlockSize * 1.5);
  }


}
