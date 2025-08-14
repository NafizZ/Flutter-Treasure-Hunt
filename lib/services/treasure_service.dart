import 'package:flutter_treasure_hunt/model/treasure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TreasureService {
  late SharedPreferences _prefs;

  final List<Treasure> _treasures = [
    Treasure(
      id: 'golden_oak',
      name: 'Golden Oak',
      description: 'Hidden near a large oak tree.',
      relativeX: 0.18,
      relativeY: 0.72,
    ),
    Treasure(
      id: 'river_rock_gem',
      name: 'River Rock Gem',
      description: 'Under the big rock by the river.',
      relativeX: 0.55,
      relativeY: 0.60,
    ),
    Treasure(
      id: 'market_square_coin',
      name: 'Market Square Coin',
      description: 'Buried in the old market square.',
      relativeX: 0.40,
      relativeY: 0.28,
    ),
    Treasure(
      id: 'lighthouse_pearl',
      name: 'Lighthouse Pearl',
      description: 'Inside a secret compartment near the hospital.',
      relativeX: 0.80,
      relativeY: 0.20,
    ),
    Treasure(
      id: 'hilltop_crown',
      name: 'Hilltop Crown',
      description: 'At the very top of the hill.',
      relativeX: 0.68,
      relativeY: 0.10,
    ),
  ];

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool isTreasureDiscovered(String treasureId) {
    return _prefs.getBool('discovered_$treasureId') ?? false;
  }

  Future<void> setTreasureDiscovered(
    String treasureId,
    bool isDiscovered,
  ) async {
    await _prefs.setBool('discovered_$treasureId', isDiscovered);
  }

  Map<String, bool> loadAllDiscoveredStates(List<Treasure> treasures) {
    final Map<String, bool> discoveredStates = {};
    for (var treasure in treasures) {
      discoveredStates[treasure.id] = isTreasureDiscovered(treasure.id);
    }
    return discoveredStates;
  }

  List<Treasure> getAllTreasures() {
    return List.unmodifiable(_treasures);
  }
}
