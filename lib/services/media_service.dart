import 'package:photo_manager/photo_manager.dart';

class MediaService {
  static Future<List<AssetEntity>> fetchRecentMedia() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (!ps.hasAccess) return [];

    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      onlyAll: true,
    );

    List<AssetEntity> media = await albums[0].getAssetListPaged(page: 0, size: 50);
    return media;
  }
}
