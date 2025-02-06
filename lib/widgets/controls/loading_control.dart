import 'package:flutter/material.dart';

class LoadingControl extends StatefulWidget {
  LoadingControl({
    super.key,
    this.shouldShowBackground = true,
    required this.animation,
    this.borderRadius,
    this.size = 200,
  });

  bool shouldShowBackground;
  String animation;
  double? borderRadius;
  double size;

  @override
  State<LoadingControl> createState() => _LoadingControlState();
}

class _LoadingControlState extends State<LoadingControl> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius != null
          ? BorderRadius.circular(widget.borderRadius!)
          : BorderRadius.zero,
      child: Stack(children: [
        Offstage(
          offstage: !widget.shouldShowBackground,
          child: Container(color: Colors.black38),
        ),
        Center()
      ]),
    );
  }
}
