import 'package:flutter/material.dart';
import 'package:flutter_treasure_hunt/model/treasure.dart';
import 'package:flutter_treasure_hunt/providers/treasure_provider.dart';
import 'package:flutter_treasure_hunt/widgets/treasure_marker.dart';
import 'package:provider/provider.dart';

class TreasureHuntScreen extends StatefulWidget {
  const TreasureHuntScreen({super.key});

  @override
  State<TreasureHuntScreen> createState() => _TreasureHuntScreenState();
}

class _TreasureHuntScreenState extends State<TreasureHuntScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _showTreasureDetails(BuildContext context, Treasure treasure) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<TreasureProvider>(
          builder: (context, provider, child) {
            bool currentDiscoveredState = provider.isTreasureDiscovered(
              treasure.id,
            );
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Text(
                treasure.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: ${treasure.description}'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: currentDiscoveredState,
                        onChanged: (bool? newValue) {
                          if (newValue != null) {
                            provider.toggleDiscovered(treasure, newValue);
                          }
                        },
                        activeColor: Colors.brown,
                      ),
                      const Text('Discovered'),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final treasureProvider = Provider.of<TreasureProvider>(context);
    final List<Treasure> treasures = treasureProvider.treasures;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Treasure Hunt',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double imageWidth = constraints.maxWidth;
          final double imageHeight = constraints.maxHeight;

          return InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(20.0),
            minScale: 0.5,
            maxScale: 4.0,
            child: Stack(
              children: [
                Image.asset(
                  'assets/map.jpg',
                  fit: BoxFit.contain,
                  width: imageWidth,
                  height: imageHeight,
                ),
                if (treasures.isNotEmpty)
                  ...treasures.map((treasure) {
                    final double markerLeft = imageWidth * treasure.relativeX;
                    final double markerTop = imageHeight * treasure.relativeY;

                    const double markerSize = 40.0;

                    return Positioned(
                      left: markerLeft - (markerSize / 2),
                      top: markerTop - (markerSize / 2),
                      child: TreasureMarker(
                        markerSize: markerSize,
                        isDiscovered: treasureProvider.isTreasureDiscovered(
                          treasure.id,
                        ),
                        onTap: () => _showTreasureDetails(context, treasure),
                      ),
                    );
                  }),
              ],
            ),
          );
        },
      ),
    );
  }
}
