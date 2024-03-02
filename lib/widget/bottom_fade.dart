import 'package:flutter/material.dart';

class BottomFade extends StatelessWidget {
  final Widget child;
  final bool showFade;

  const BottomFade({super.key, required this.child, required this.showFade});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (showFade)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.grey.withOpacity(0.8),
                    Colors.grey.withOpacity(0)
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
