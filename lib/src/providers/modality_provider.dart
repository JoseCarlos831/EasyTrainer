// lib/src/services/modality_service.dart
import 'package:flutter/material.dart';
import '../models/modality_model.dart';

import '../services/modality_service.dart';

class ModalityProvider with ChangeNotifier {
  final ModalityService _modalityService = ModalityService();

  List<ModalityModel> _modalities = [];
  bool _isLoading = false;

  List<ModalityModel> get modalities => _modalities;
  bool get isLoading => _isLoading;

  Future<void> fetchModalities(String token) async {
    _isLoading = true;
    notifyListeners();

    _modalities = await _modalityService.fetchModalities(token);
    print('[ModalityProvider] Modalities loaded: ${_modalities.length}');

    _isLoading = false;
    notifyListeners();
  }
}
