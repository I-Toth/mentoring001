import 'package:mentoring001/mentoring001.dart';

///Ez az osztály határozza meg, hogy a [fetchAlbums] függvénynek léteznie kell minden olyan osztályban, amely implementálja ezt az interfészt.
///Ez a függvény egy jövőbeli listát [Future<List<AlbumModel>?>] ad vissza, ami albumok listája lehet, vagy [null].
abstract class AlbumRepositoryBase {
  Future<List<AlbumModel>?> fetchAlbums();
}
