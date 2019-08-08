import 'package:flutter/widgets.dart';

// * Prevent glow effect from overscrolling
class NoOverscrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
