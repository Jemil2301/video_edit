import 'package:flutter/material.dart';

class MovingWidget extends StatefulWidget {
  final Widget widgetToMove;

  MovingWidget({this.widgetToMove});
  @override
  _MovingWidgetState createState() => _MovingWidgetState();
}

class _MovingWidgetState extends State<MovingWidget> {
  Offset offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              offset = Offset(
                  offset.dx + details.delta.dx, offset.dy + details.delta.dy);
            });
          },
          child: SizedBox(
            width: 300,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: widget.widgetToMove,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
