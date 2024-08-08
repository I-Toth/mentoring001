
///Ez egy egyszerű adatmodell, amely két attribútumot tartalmaz: [id] és [title].
class AlbumModel {
  final int id;
  final String title;

  AlbumModel({required this.id, required this.title});

  ///Ez az osztály tartalmaz egy gyári konstruktort [fromJson], amely egy JSON objektumból hoz létre [AlbumModel] példányokat.
  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
