import 'package:example/core.dart';
import 'package:flutter/material.dart';

class ExButton extends StatelessWidget {
  final String? label;
  final Function onPressed;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final double? height;
  final double? width;
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;
  final bool useShadow;
  final double radius;
  final double? fontSize;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool enabled;
  final bool outline;
  final double? size;

  const ExButton({
    Key? key,
    required this.onPressed,
    this.label,
    this.color,
    this.textColor,
    this.icon,
    this.height = 50,
    this.width,
    this.borderRadius,
    this.boxShadow,
    this.radius = 30.0,
    this.useShadow = false,
    this.fontSize,
    this.margin,
    this.padding,
    this.enabled = true,
    this.outline = false,
    this.size,
  }) : super(key: key);

  getColor(context) {
    if (outline) return Colors.white;
    return enabled ? (color ?? Theme.of(context).primaryColor) : disabledColor;
  }

  getTextColor() {
    if (outline) return color ?? primaryColor;
    if (textColor != null) return textColor;
    return color == disabledColor ? disabledTextColor : Colors.white;
  }

  getWidth() {
    return width;
  }

  getIconColor() {
    if (outline) return color ?? primaryColor;
    return color == disabledColor ? disabledTextColor : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth() ?? MediaQuery.of(context).size.width,
      height: height,
      margin: margin ??
          const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            bottom: 10.0,
            top: 10.0,
          ),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          shadowColor: useShadow == true ? null : Colors.transparent,
          backgroundColor:
              getColor(context) ?? primaryColor, //background color of button
          side: outline == false
              ? null
              : BorderSide(
                  width: 2,
                  color: (color ?? primaryColor),
                ), //border width and color

          elevation: 3, //elevation of button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: getIconColor(),
                  size: 28,
                ),
              if (icon != null && label != null)
                const SizedBox(
                  width: 6.0,
                ),
              if (label != null)
                Text(
                  "$label",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: getTextColor(),
                    fontSize: 14,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
