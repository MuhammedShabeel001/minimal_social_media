import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:photo_manager/photo_manager.dart';

import '../services/media_service.dart';

class MediaProvider extends ChangeNotifier {
  List<AssetEntity> _recentMedia = [];
  List<AssetEntity> _selectedMedia = [];

  List<AssetEntity> get recentMedia => _recentMedia;
  List<AssetEntity> get selectedMedia => _selectedMedia;

  Future<void> loadMedia() async {
    _recentMedia = await MediaService.fetchRecentMedia();
    notifyListeners();
  }

  void toggleSelection(AssetEntity media) {
    if (_selectedMedia.contains(media)) {
      _selectedMedia.remove(media);
    } else {
      _selectedMedia.add(media);
    }
    notifyListeners();
  }
}
