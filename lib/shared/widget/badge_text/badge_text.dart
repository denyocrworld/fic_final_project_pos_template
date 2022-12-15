import 'package:badges/badges.dart';
import 'package:example/core.dart';

import 'package:flutter/material.dart';

class BadgeText extends StatefulWidget {
  final Color? backgroundColor;
  final String? text;
  final bool? showBadge;
  final bool? isButton;
  final Color? textColor;
  final bool enabled;
  final bool outline;
  final Color? foregroundColor;
  final String? badgeText;
  final BadgePosition? position;
  final Widget? badgeContent;

  const BadgeText({
    Key? key,
    this.badgeContent,
    this.foregroundColor,
    this.enabled = true,
    this.outline = false,
    this.textColor,
    this.isButton = true,
    this.showBadge = false,
    required this.text,
    this.badgeText,
    this.backgroundColor,
    this.position,
  }) : super(key: key);

  @override
  State<BadgeText> createState() => _BadgeTextState();
}

class _BadgeTextState extends State<BadgeText> {
  bool isButtonActive = true;
  getColor(context) {
    if (widget.outline) return Colors.white;
    return widget.enabled
        ? (widget.backgroundColor ?? Theme.of(context).primaryColor)
        : disabledColor;
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
      showBadge: widget.showBadge!,
      position: widget.position,
      badgeContent: widget.badgeContent,
      child: SizedBox(
        height: 40.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: widget.foregroundColor,
            backgroundColor:
                getColor(context) ?? primaryColor, //background color of button
            side: widget.outline == false
                ? null
                : BorderSide(
                    width: 2, color: widget.backgroundColor ?? primaryColor),
          ),
          onPressed: () {},
          child: Text(
            widget.text!,
            style: TextStyle(
              color: widget.textColor,
              fontSize: fs6,
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
//         width = 10,
//         height = 10,
//         alignment = Alignment.center,
//         child = const Text(
//           '1',
//           style: TextStyle(color: Colors.white, fontSize: 10.0),
//         ),
//       ),

//  opsi 2

// Container(
//         decoration: BoxDecoration(
//             color: getColor(context) ?? primaryColor,
//             border: widget.outline == false
//                 ? Border.all(
//                     width: 1.0, color: (widget.backgroundColor ?? primaryColor))
//                 : null),
//         height: 20.0,
//         child: Material(
//           color: Colors.transparent,
//           child: InkWell(
//               onTap: isButtonActive
//                   ? () {
//                       setState(() => isButtonActive = widget.isButton!);
//                     }
//                   : null,
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Center(
//                     child: Text(widget.text!,
//                         style: TextStyle(
//                           color: widget.textColor,
//                           fontSize: fs6,
//                         ))),
//               )),
//         ),
//       ),
