import 'package:mentoring001/mentoring001.dart';

///Ez az osztály felelős az adatkezelésért
class AlbumProvider extends ChangeNotifier {
  final AlbumRepositoryBase _repo;
  final albumsStreamHolder = StreamHolder<List<AlbumModel>?>(null);
  final searchStreamHolder = StreamHolder<List<AlbumModel>?>(null);
  List<AlbumModel>? _allAlbums;

  ///Hozzáadtam egy opcionális [repo] paramétert az [AlbumProvider] konstruktorához, amely lehetővé teszi, hogy egy különböző [repository]-t adjunk át neki, például egy [fake repository]-t teszteléshez.
  AlbumProvider({AlbumRepositoryBase? repo})
      : _repo = repo ?? AlbumRepository();

  ///Ez az osztály tartalmazza a [fetchAlbums] függvényt, amely az [albumokat] tölti le az [API]-ról, és frissíti a [stream]-eket az új adatokkal vagy hibákkal.
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

  ///A [searchAlbums] függvény pedig a keresési funkcióért felelős, amely szűri az [albumokat] a megadott keresési kifejezés alapján.
  void searchAlbums(String query) {
    if (query.isEmpty) {
      searchStreamHolder.addData(_allAlbums);
    } else {
      final filteredAlbums = _allAlbums?.where((album) => album.title.toLowerCase().contains(query.toLowerCase())).toList();
      searchStreamHolder.addData(filteredAlbums);
    }
  }
}
