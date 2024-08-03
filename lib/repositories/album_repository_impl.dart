import 'package:mentoring001/mentoring001.dart';
import 'package:http/http.dart' as http;

class AlbumRepository implements AlbumRepositoryBase {
  @override
  Future<List<AlbumModel>> fetchAlbums() async {
/*    // Mockolt adatok
    await Future.delayed(const Duration(seconds: 2));
    return [
      AlbumModel(id: 1, title: 'Album 1'),
      AlbumModel(id: 2, title: 'Album 2'),
      AlbumModel(id: 3, title: 'Album 3'),
    ];*/

    // Valódi API hívás
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((album) => AlbumModel.fromJson(album)).toList();
      } else {
        throw 'Failed to load albums';
      }
    } catch (e) {
      throw '$e';
    }
  }
}
