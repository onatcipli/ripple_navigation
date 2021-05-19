import 'package:flutter/material.dart';
import 'package:ripple_navigation/ripple_circle.dart';
import 'package:ripple_navigation/ripple_route_builder.dart';

class RippleLocation extends StatefulWidget {
  final Widget child;
  final GlobalKey<RippleLocationState> rippleController;
  final Duration duration;

  final double rippleSize;

  const RippleLocation({
    Key key,
    this.child,
    this.rippleController,
    this.duration = const Duration(milliseconds: 600),
    this.rippleSize,
  }) : super(key: rippleController ?? key);

  @override
  RippleLocationState createState() => RippleLocationState();
}

class RippleLocationState extends State<RippleLocation> {
  GlobalKey _rippleLocationKey = GlobalKey();

  GlobalKey<RippleCircleState> rippleController = GlobalKey();

  pushRippleTransitionPage(BuildContext context, Widget widget) {
    forwardRipple();
    Navigator.push(
      context,
      RippleRouteBuilder(
        page: widget,
        duration: this.widget.duration + this.widget.duration,
      ),
    );
  }

  pushRippleTransitionWithRouteName(BuildContext context,
      {String route, dynamic arguments}) {
    forwardRipple();
    Navigator.pushNamed(
      context,
      route,
      arguments: arguments,
    );
  }

  /// this method for only animating Ripple effect from the [RippleLocation] widget
  forwardRipple() async {
    rippleController.currentState.animate();
    // await Future.delayed(duration);
  }

  reverseRipple() {
    rippleController.currentState.reverseAnimate();
  }

  handleRippleAnimation() async {
    RenderBox findRenderObject =
        _rippleLocationKey.currentContext.findRenderObject();
    var widgetSize = findRenderObject.size;
    Offset localToGlobal = findRenderObject.localToGlobal(Offset(
      widgetSize.width / 2,
      widgetSize.height / 2,
    ));
    final fullscreenSize = 2 * MediaQuery.of(context).size.longestSide;
    Overlay.of(context).insert(
      OverlayEntry(builder: (BuildContext context) {
        return RippleCircle(
          currentPosition: localToGlobal,
          rippleController: rippleController,
          duration: widget.duration,
          fullScreenSize: widget.rippleSize ?? fullscreenSize,
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      handleRippleAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _rippleLocationKey,
      child: widget.child,
    );
  }
}
