// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
