import 'package:mentoring001/mentoring001.dart';

class AlbumProvider extends ChangeNotifier {
  final AlbumRepositoryBase _repo = AlbumRepository();
  final albumsStreamHolder = StreamHolder<List<AlbumModel>?>(null);

  Future<void> fetchAlbums() async {
    try {
      final albums = await _repo.fetchAlbums();
      albumsStreamHolder.addData(albums);
    } catch (e) {
      albumsStreamHolder.addError(e);
    }
  }
}