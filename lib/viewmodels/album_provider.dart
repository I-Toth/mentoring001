import 'package:mentoring001/mentoring001.dart';

class AlbumProvider extends ChangeNotifier {
  final AlbumRepositoryBase _repo = AlbumRepository();
  final albumsStreamHolder = StreamHolder<List<AlbumModel>?>(null);
  final searchStreamHolder = StreamHolder<List<AlbumModel>?>(null);
  List<AlbumModel>? _allAlbums;

  Future<void> fetchAlbums() async {
    try {
      final albums = await _repo.fetchAlbums();
      _allAlbums = albums;
      albumsStreamHolder.addData(albums);
      searchStreamHolder.addData(albums);
    } catch (e) {
      albumsStreamHolder.addError(e);
      searchStreamHolder.addError(e);
    }
  }

  void searchAlbums(String query) {
    if (query.isEmpty) {
      searchStreamHolder.addData(_allAlbums);
    } else {
      final filteredAlbums = _allAlbums
          ?.where((album) => album.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      searchStreamHolder.addData(filteredAlbums);
    }
  }
}