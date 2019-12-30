import 'package:flutter/material.dart';

class FSwitch extends StatefulWidget {
  bool value;
  ValueChanged<bool> onChanged;
  double width;
  double height;
  double offset;
  double textOffset;
  Color textColor;
  Color selectedTextColor;
  double textSize;
  String text;
  String selectedText;
  Color backgroundColor;
  Color selectedBackgroundColor;
  Color color;
  double fixOffset;
  bool enable;

  FSwitch({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.width = 59.23,
    this.height,
    this.offset,
    this.textOffset,
    this.textColor = Colors.white,
    this.textSize,
    this.selectedTextColor = Colors.white,
    this.text,
    this.selectedText,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.color,
    this.enable = true,
  })  : assert(value != null && onChanged != null,
            "value and onChanged can't be None!"),
        fixOffset = value
            ? width -
                (offset ?? 2 / 36 * ((height ?? width * 0.608))) * 2 -
                (height ?? width * 0.608) * (32.52 / 36)
            : 0,
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FSwitch();
  }
}

class _FSwitch extends State<FSwitch> {
  @override
  Widget build(BuildContext context) {
    double height = widget.height ?? widget.width * 0.608;
    double circleSize = (height * (32.52 / 36));
    widget.offset = widget.offset ?? 2 / 36 * height;
    double textOffset = widget.textOffset ?? height / 3;
    widget.backgroundColor = widget.backgroundColor ?? Color(0xffcccccc);
    widget.selectedBackgroundColor =
        widget.selectedBackgroundColor ?? Color(0xffffc900);
    return GestureDetector(
      onTap: widget.enable ? _handleOnTap : null,
      onHorizontalDragEnd: widget.enable ? _handleOnHorizontalDragEnd : null,
      onHorizontalDragUpdate:
          widget.enable ? _handleOnHorizontalDragUpdate : null,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 350),
            decoration: BoxDecoration(
                color: (widget.value
                        ? widget.selectedBackgroundColor
                        : widget.backgroundColor) ??
                    widget.backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(height / 2))),
            child: Container(
              width: widget.width,
              height: height,
            ),
          ),
          Positioned(
            left: widget.value ? textOffset : null,
            right: widget.value ? null : textOffset,
            child: Opacity(
              opacity: widget.text == null ? 0 : 1,
              child: Text(
                (widget.value ? widget.selectedText : widget.text) ?? '',
                style: TextStyle(
                    color: (widget.value
                            ? widget.selectedTextColor
                            : widget.textColor) ??
                        Color(0xffcccccc),
                    fontSize: widget.textSize ?? height / 2),
              ),
            ),
          ),
          AnimatedContainer(
            margin:
                EdgeInsets.fromLTRB(widget.offset + widget.fixOffset, 0, 0, 0),
            duration: Duration(milliseconds: 200),
            child: Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                  color: widget.color ?? Color(0xffffffff),
                  borderRadius:
                      BorderRadius.all(Radius.circular(circleSize / 2))),
            ),
          ),
          Opacity(
            opacity: widget.enable ? 0 : 0.8,
            child: Container(
              width: widget.width,
              height: height,
              decoration: BoxDecoration(
                  color: Color(0xfff1f1f1),
                  borderRadius: BorderRadius.all(Radius.circular(height / 2))),
            ),
          ),
        ],
      ),
    );
  }

  void _handleOnTap() {
    setState(() {
      widget.value = !widget.value;
      double height = widget.height ?? widget.width * 0.608;
      double circleSize = (height * (32.52 / 36));
      if (widget.value) {
        widget.fixOffset =
            widget.width - widget.offset - circleSize - widget.offset;
      } else {
        widget.fixOffset = 0;
      }
      widget.onChanged(widget.value);
    });
  }

  void _handleOnHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      double height = widget.height ?? widget.width * 0.608;
      double circleSize = (height * (32.52 / 36));
      widget.fixOffset = widget.fixOffset + details.delta.dx;
      if (widget.fixOffset < 0) {
        widget.fixOffset = 0;
      } else if (widget.fixOffset > widget.width - widget.offset - circleSize) {
        widget.fixOffset =
            widget.width - widget.offset - circleSize - widget.offset;
      }
    });
  }

  void _handleOnHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      double height = widget.height ?? widget.width * 0.608;
      double circleSize = (height * (32.52 / 36));
      double center =
          (widget.width - widget.offset - circleSize - widget.offset) / 2;
      bool cacheValue = widget.value;
      if (widget.fixOffset < center) {
        widget.fixOffset = 0;
        widget.value = false;
      } else {
        widget.fixOffset = center * 2;
        widget.value = true;
      }
      if (cacheValue != widget.value) {
        widget.onChanged(widget.value);
      }
    });
  }
}
