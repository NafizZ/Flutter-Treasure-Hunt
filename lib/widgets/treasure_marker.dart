import 'package:flutter/material.dart';

class TreasureMarker extends StatelessWidget {
  final double markerSize;
  final bool isDiscovered;
  final VoidCallback onTap;

  const TreasureMarker({
    super.key,
    this.markerSize = 40.0,
    required this.isDiscovered,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: markerSize,
        height: markerSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDiscovered
              ? Colors.green.withValues(alpha: 0.7) // Discovered color
              : Colors.red.withValues(alpha: 0.7), // Undiscovered color
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            'assets/treasure_icon.jpg',
            width: markerSize * 0.7,
            height: markerSize * 0.7,
          ),
        ),
      ),
    );
  }
}
