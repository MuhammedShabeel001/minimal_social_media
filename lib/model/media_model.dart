import 'package:hive/hive.dart';

part 'media_model.g.dart';

@HiveType(typeId: 0)
class MediaModel {
  @HiveField(0)
  final String id;

  MediaModel({required this.id});
}
