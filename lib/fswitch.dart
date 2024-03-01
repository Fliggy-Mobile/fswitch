import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 一个有趣的、实用的开关组件。支持设置提示、滑块装饰、阴影以及良好的交互。
///
/// An interesting and practical switch component.
/// Supports setting tips, slider decorations, shadows, and good interaction.
// ignore: must_be_immutable
class FSwitch extends StatefulWidget {
  /// 是否处于打开状态。默认 false。
  ///
  /// Whether it is open. The default value is false.
  bool open;

  /// 当开关状态发生改变时，会回调该函数。
  ///
  /// This function will be called back when the switch state changes.
  ValueChanged<bool> onChanged;

  /// 宽度。默认 59.23，符合美学 😃
  ///
  /// width. Default 59.23, in line with aesthetics 😃
  double? width;

  /// 高度。默认会根据 [width] 进行计算，符合美学 😃
  ///
  /// height. By default, it will be calculated according to [width], which is in line with aesthetics 😃
  double? height;

  /// 滑块与边缘的间距
  ///
  /// Distance between slider and edge
  double? offset;

  /// 打开状态的提示样式
  ///
  /// Prompt style of open state
  Widget? openChild;

  /// 关闭状态的提示样式
  ///
  /// Prompt style of closed state
  Widget? closeChild;

  /// 提示与边缘的间距
  ///
  /// Prompt to edge distance
  double? childOffset;

  /// 关闭状态下的背景色
  ///
  /// Background color when off
  Color? color;

  /// 打开状态下的背景色
  ///
  /// Background color when open
  Color? openColor;

  /// 滑块颜色
  ///
  /// Slider color
  Color? sliderColor;

  /// 滑块中的组件。超过范围会被剪裁。
  ///
  /// Components in the slider。Beyond the range will be cropped。
  Widget? sliderChild;

  /// 是否可用
  ///
  /// it's usable or not
  bool enable = true;

  /// 设置组件阴影颜色
  ///
  /// Set component shadow color
  Color? shadowColor;

  /// 设置组件阴影偏移
  ///
  /// Set component shadow offset
  Offset? shadowOffset;

  /// 设置组件高斯与阴影形状卷积的标准偏差。
  ///
  /// Sets the standard deviation of the component's Gaussian convolution with the shadow shape.
  double? shadowBlur;

  FSwitch({
    Key? key,
    required this.onChanged,
    this.open = false,
    this.width = 59.23,
    this.height,
    this.offset,
    this.childOffset,
    this.closeChild,
    this.openChild,
    this.color,
    this.openColor,
    this.sliderColor,
    this.sliderChild,
    this.enable = true,
    this.shadowColor,
    this.shadowOffset,
    this.shadowBlur = 0.0,
  })  : assert(open != null && onChanged != null,
            "open and onChanged can't be None!"),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FSwitch();
  }
}

class _FSwitch extends State<FSwitch> {
  double fixOffset = 0;
  bool draging = false;
  double dragDxW = 10.0;

  @override
  void initState() {
    super.initState();
    double width = widget.width ?? 0;
    fixOffset = widget.open
        ? width -
            (widget.offset ?? 2.0 / 36.0 * ((widget.height ?? width * 0.608))) *
                2.0 -
            (widget.height ?? width * 0.608) * (32.52 / 36.0)
        : 0;
  }

  @override
  void didUpdateWidget(FSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    double width = widget.width ?? 0;
    fixOffset = widget.open
        ? width -
            (widget.offset ??
                    2.0 / 36.0 * ((widget.height ?? width * 0.608))) *
                2.0 -
            (widget.height ?? width * 0.608) * (32.52 / 36.0)
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.height ?? widget.width ?? 0 * 0.608;
    double circleSize = (height * (32.52 / 36.0));
    widget.offset = widget.offset ?? 2.0 / 36.0 * height;
    double childOffset = widget.childOffset ?? height / 5.0;
    widget.color = widget.color ?? Color(0xffcccccc);
    widget.openColor = widget.openColor ?? Color(0xffffc900);

    List<Widget> children = [];

    /// background
    var showShadow = widget.shadowColor != null && widget.shadowBlur != 0;
    var background = AnimatedContainer(
      duration: Duration(milliseconds: 350),
      decoration: BoxDecoration(
        color: (widget.open ? widget.openColor : widget.color) ?? widget.color,
        borderRadius: BorderRadius.all(Radius.circular(height / 2.0)),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: widget.shadowColor!,
                  offset: widget.shadowOffset ?? Offset(0, 0),
                  blurRadius: widget.shadowBlur ?? 1.0,
                )
              ]
            : null,
      ),
      child: Container(
        width: widget.width,
        height: height,
      ),
    );
    children.add(background);

    /// Prompt
    var showChild = widget.open ? widget.openChild : widget.closeChild;
    if (showChild != null) {
      showChild = Positioned(
        left: widget.open ? childOffset : null,
        right: widget.open ? null : childOffset,
        child: showChild,
      );
      children.add(showChild);
    }

    /// slider
    var slider = AnimatedContainer(
      margin: EdgeInsets.fromLTRB(widget.offset ?? 0 + fixOffset, 0, 0, 0),
      duration: Duration(milliseconds: 200),
      width: circleSize + (draging ? dragDxW : 0.0),
      child: Container(
        height: circleSize,
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.sliderColor ?? Color(0xffffffff),
            borderRadius: BorderRadius.all(Radius.circular(circleSize / 2.0))),
        child: widget.sliderChild,
      ),
    );
    children.add(slider);

    /// When in an unavailable state, add a mask
    if (!widget.enable) {
      var disableMask = Opacity(
        opacity: 0.6,
        child: Container(
          width: widget.width,
          height: height,
          decoration: BoxDecoration(
              color: Color(0xfff1f1f1),
              borderRadius: BorderRadius.all(Radius.circular(height / 2.0))),
        ),
      );
      children.add(disableMask);
    }

    return GestureDetector(
      onTap: widget.enable ? _handleOnTap : null,
      onHorizontalDragEnd: widget.enable ? _handleOnHorizontalDragEnd : null,
      onHorizontalDragUpdate:
          widget.enable ? _handleOnHorizontalDragUpdate : null,
      onHorizontalDragCancel: widget.enable ? _handleDragCancel : null,
      onHorizontalDragStart: widget.enable ? _handleDragStart : null,
      child: Container(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: children,
        ),
      ),
    );
  }

  void _handleOnTap() {
    setState(() {
      widget.open = !widget.open;
      double height = widget.height ?? widget.width ?? 0 * 0.608;
      double circleSize = (height * (32.52 / 36.0));
      if (widget.open) {
        fixOffset = widget.width ?? 0 - (widget.offset ?? 0) - circleSize - (widget.offset ??0);
      } else {
        fixOffset = 0;
      }
      widget.onChanged(widget.open);
    });
  }

  void _handleDragStart(DragStartDetails details) {
    setState(() {
      draging = true;
    });
  }

  void _handleOnHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      double width = widget.width ?? 0;
      double height = widget.height ?? width * 0.608;
      double circleSize = (height * (32.52 / 36.0));
      fixOffset = fixOffset + details.delta.dx;
      double offset = widget.offset ?? 0;
      if (fixOffset < 0) {
        fixOffset = 0;
      } else if (fixOffset >
          width -
              offset -
              circleSize -
              (draging ? dragDxW : 0.0) -
              offset) {
        fixOffset = width -
            offset -
            circleSize -
            (draging ? dragDxW : 0.0) -
            offset;
      }
    });
  }

  void _handleOnHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      draging = false;
      double width = widget.width ?? 0;
      double height = widget.height ?? width * 0.608;
      double circleSize = (height * (32.52 / 36.0));
      double offset = widget.offset ?? 0;
      double center = (width -
              offset -
              circleSize -
              (draging ? dragDxW : 0.0) -
              offset) /
          2;
      bool cacheValue = widget.open;
      if (fixOffset < center) {
        fixOffset = 0;
        widget.open = false;
      } else {
        fixOffset = center * 2;
        widget.open = true;
      }
      if (cacheValue != widget.open) {
        widget.onChanged(widget.open);
      }
    });
  }

  void _handleDragCancel() {
    setState(() {
      draging = false;
    });
  }
}
