import 'package:mentoring001/mentoring001.dart';

class AlbumProvider extends ChangeNotifier {
  final AlbumRepositoryBase _repo = AlbumRepository();
  final albumsStreamHolder = StreamHolder<List<AlbumModel>?>(null);
  final searchStreamHolder = StreamHolder<List<AlbumModel>?>(null);
  List<AlbumModel>? _allAlbums;

  Future<void> fetchAlbums() async {
    final albums = await _repo.fetchAlbums();
    if (albums != null) {
      _allAlbums = albums;
      albumsStreamHolder.addData(albums);
      searchStreamHolder.addData(albums);
    } else {
      const error = 'Failed to load albums';
      albumsStreamHolder.addError(error);
      searchStreamHolder.addError(error);
    }
  }

  void searchAlbums(String query) {
    if (query.isEmpty) {
      searchStreamHolder.addData(_allAlbums);
    } else {
      final filteredAlbums = _allAlbums?.where((album) => album.title.toLowerCase().contains(query.toLowerCase())).toList();
      searchStreamHolder.addData(filteredAlbums);
    }
  }
}
