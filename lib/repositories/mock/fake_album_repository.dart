import 'package:mentoring001/mentoring001.dart';

class FakeAlbumRepository implements AlbumRepositoryBase {
  @override
  Future<List<AlbumModel>?> fetchAlbums() async {
    /// Mock adatok létrehozása
    return [
      AlbumModel(id: 1, title: 'Mock Album 1'),
      AlbumModel(id: 2, title: 'Mock Album 2'),
    ];
  }
}
