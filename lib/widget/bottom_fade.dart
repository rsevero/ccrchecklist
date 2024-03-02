import 'package:flutter/material.dart';

class BottomFade extends StatelessWidget {
  final Widget child;
  final bool showFade;

  const BottomFade({super.key, required this.child, required this.showFade});

  @override
  Widget build(BuildContext context) {
    final Color fadeColor = Theme.of(context).colorScheme.onSecondaryContainer;

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
                    fadeColor.withOpacity(0.7),
                    fadeColor.withOpacity(0)
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
