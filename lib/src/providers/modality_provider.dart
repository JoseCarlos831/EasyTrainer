// lib/src/services/modality_service.dart

import 'package:flutter/material.dart';
import '../models/modality_model.dart';

import '../services/modality_service.dart';

class ModalityProvider with ChangeNotifier {
  final ModalityService _modalityService;

  ModalityProvider({ModalityService? modalityService})
  : _modalityService = modalityService ?? ModalityService();

  List<ModalityModel> _modalities = [];
  bool _isLoading = false;

  List<ModalityModel> get modalities => _modalities;
  bool get isLoading => _isLoading;

  void clear() {
    _modalities = [];
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchModalities(String token) async {
    _isLoading = true;
    notifyListeners();

    _modalities = await _modalityService.fetchModalities(token);
    print('[ModalityProvider] Modalities loaded: ${_modalities.length}');

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMissingModalities(
    List<int> modalityIds,
    String token,
  ) async {
    final missingIds = modalityIds.where(
      (id) => !_modalities.any((m) => m.id == id),
    );

    for (final id in missingIds) {
      final modality = await _modalityService.fetchById(id, token);
      if (modality != null) {
        _modalities.add(modality);
      }
    }

    if (missingIds.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }
}
