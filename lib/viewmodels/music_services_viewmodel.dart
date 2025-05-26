import 'package:flutter/foundation.dart';
import '../models/music_service.dart';
import '../repositories/music_service_repository.dart';

class MusicServicesViewModel extends ChangeNotifier {
  final MusicServiceRepository _repository;
  List<MusicService> _services = [];
  bool _isLoading = false;
  String? _error;

  MusicServicesViewModel(this._repository);

  List<MusicService> get services => _services;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadMusicServices() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _services = await _repository.getMusicServices();
    } catch (e) {
      _error = 'Failed to load music services: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
