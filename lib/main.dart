import 'dart:math';
import 'package:flutter/material.dart';

class ColorBoxGrid extends StatefulWidget {
  @override
  _ColorBoxGridState createState() => _ColorBoxGridState();
}

class _ColorBoxGridState extends State<ColorBoxGrid> {
  Map<Color, String> boxData = {
    Colors.blue: 'Blue',
    Colors.green: 'Green',
    Colors.red: 'Red',
    Colors.pink: 'Pink',
    Colors.black: 'Black',
    Colors.brown: 'Brown',
    Colors.yellow: 'Yellow',
    Colors.orange: 'Orange',
    // Add more colors and names to the map if needed
  };

  List<Color> selectedColors = [];
  List<String> selectedNames = [];

  @override
  void initState() {
    super.initState();
    _selectRandomColors();
  }

  void _selectRandomColors() {
    final random = Random();

    final availableColors = boxData.keys.toList();
    final availableNames = boxData.values.toList();

    availableNames.shuffle(random);
    selectedNames = availableNames.sublist(0, 4);

    while (selectedColors.length < 4) {
      final randomIndex = random.nextInt(availableColors.length);
      final randomColor = availableColors[randomIndex];

      if (!selectedColors.contains(randomColor)) {
        selectedColors.add(randomColor);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: selectedColors.map((color) {
        final name = selectedNames[selectedColors.indexOf(color)];

        return Container(
          color: color,
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: color.computeLuminance() > 0.5
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ColorBoxGrid(),
  ));
}


// Colors.blue: 'Blue',
// Colors.green: 'Green',
// Colors.red: 'Red',
// Colors.pink: 'Pink',
// Colors.black: 'Black',
// Colors.brown: 'Brown',
// Colors.yellow: 'Yellow',
// Colors.orange: 'Orange',
   