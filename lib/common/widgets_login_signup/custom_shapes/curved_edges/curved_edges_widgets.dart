import 'package:flutter/material.dart';
import 'package:t_store/common/widgets_login_signup/custom_shapes/curved_edges/curved_edges.dart';

class TCurvedEdgeWidgets extends StatelessWidget {
  const TCurvedEdgeWidgets({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}
