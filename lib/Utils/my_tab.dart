// A reusable UI component for creating a custom tab in the TabBar.
// It displays an image inside a decorated container.
import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;

  const MyTab({super.key, required this.iconPath});

  @override 
  Widget build(BuildContext context) {
    //Detects the Theme
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    // Returns a Tab widget with custom padding, decoration, and image.
    return Tab(
      height: 80,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          //Adapts the theme
          color: isDark ? Colors.grey[800] : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(
          iconPath,
          color: isDark ? Colors.white : Colors.blueGrey[600],
        ),
      ),
    );
  }
}
