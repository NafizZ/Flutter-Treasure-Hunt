import 'package:flutter/material.dart';
import 'package:flutter_treasure_hunt/model/treasure.dart';
import 'package:flutter_treasure_hunt/services/treasure_service.dart';

class TreasureProvider with ChangeNotifier {
  final TreasureService _treasureService = TreasureService();

  List<Treasure> _treasures = [];
  Map<String, bool> _discoveredTreasures = {};

  List<Treasure> get treasures => _treasures;
  Map<String, bool> get discoveredTreasures => _discoveredTreasures;

  TreasureProvider() {
    _loadTreasureData();
  }

  Future<void> _loadTreasureData() async {
    await _treasureService.init();
    _treasures = _treasureService.getAllTreasures();
    _discoveredTreasures = _treasureService.loadAllDiscoveredStates(_treasures);

    notifyListeners();
  }

  Future<void> toggleDiscovered(Treasure treasure, bool isDiscovered) async {
    _discoveredTreasures[treasure.id] = isDiscovered;
    await _treasureService.setTreasureDiscovered(treasure.id, isDiscovered);
    notifyListeners();
  }

  bool isTreasureDiscovered(String treasureId) {
    return _discoveredTreasures[treasureId] ?? false;
  }
}
