import 'package:flutter/material.dart';
import 'package:uji_individu/model/bio.dart';

class Kehadiran with ChangeNotifier {
  final List<Bio> _pelajar = [
    Bio(nama: 'Ali'),
    Bio(nama: 'Ali'),
    Bio(nama: 'Ali'),
  ];

  List<Bio> get pelajar => _pelajar;
  final List<Map<String, dynamic>> _historyKehadiran = [];
  List<Map<String, dynamic>> get historyKehadiran => _historyKehadiran;

  void toggleKehadiran(int index) {
    _pelajar[index].isPresent = !_pelajar[index].isPresent;
    notifyListeners();
  }

  void saveKehadiran() {
    final presentCount = _pelajar.where((s) => s.isPresent).length;
    final absenCount = _pelajar.length - presentCount;

    _historyKehadiran.insert(0, {
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absenCount,
    });

    for (var pelajar in _pelajar) {
      pelajar.isPresent = false;
    }
    notifyListeners();
  }
}
