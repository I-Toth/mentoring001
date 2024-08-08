import 'package:mentoring001/mentoring001.dart';
// import 'package:http/http.dart' as http;
import 'request_album.dart';

// class AlbumRepository implements AlbumRepositoryBase {
//   static const String baseUrl = 'https://jsonplaceholder.typicode.com';
//
//   @override
//   Future<List<AlbumModel>?> fetchAlbums() async {
// /*    // Mockolt adatok
//     await Future.delayed(const Duration(seconds: 2));
//     return [
//       AlbumModel(id: 1, title: 'Album 1'),
//       AlbumModel(id: 2, title: 'Album 2'),
//       AlbumModel(id: 3, title: 'Album 3'),
//     ];*/
//
//     // Valódi API hívás
//
//     final response = await http.get(Uri.parse('$baseUrl/albums'));
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((album) => AlbumModel.fromJson(album)).toList();
//     } else {
//       return null;
//     }
//   }
// }

///Ez az osztály a [fetchAlbums] függvényt valósítja meg, ami az [AlbumRepositoryRequest] osztály [send] függvényét hívja meg.
///Ez a függvény végzi el a tényleges [API] hívást és visszaadja az eredményt.
class AlbumRepository implements AlbumRepositoryBase {
  @override
  Future<List<AlbumModel>?> fetchAlbums() async {
    final response = await AlbumRepositoryRequest().send();
    return response;
  }
}
