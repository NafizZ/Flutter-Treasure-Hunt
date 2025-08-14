import 'package:flutter_treasure_hunt/model/treasure.dart';

class TreasureService {
  final List<Treasure> _treasures = [
    Treasure(
      id: 'golden_oak',
      name: 'Golden Oak',
      description: 'Hidden near a large oak tree.',
      relativeX: 0.20,
      relativeY: 0.75,
    ),
    Treasure(
      id: 'river_rock_gem',
      name: 'River Rock Gem',
      description: 'Under the big rock by the river.',
      relativeX: 0.60,
      relativeY: 0.55,
    ),
    Treasure(
      id: 'market_square_coin',
      name: 'Market Square Coin',
      description: 'Buried in the old market square.',
      relativeX: 0.40,
      relativeY: 0.30,
    ),
    Treasure(
      id: 'hospital_pearl',
      name: 'Hospital Pearl',
      description: 'Inside a secret compartment near the hospital.',
      relativeX: 0.80,
      relativeY: 0.40,
    ),
    Treasure(
      id: 'hilltop_crown',
      name: 'Hilltop Crown',
      description: 'At the very top of the hill.',
      relativeX: 0.15,
      relativeY: 0.10,
    ),
  ];
}
