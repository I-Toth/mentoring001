import 'package:mentoring001/mentoring001.dart';

abstract class AlbumRepositoryBase {
  Future<List<AlbumModel>?> fetchAlbums();
}
