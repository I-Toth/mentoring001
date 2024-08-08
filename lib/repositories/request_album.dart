import 'package:mentoring001/mentoring001.dart';

///Ez az osztály örökli a [HTTPRequestHolder] osztályt, és megadja az [API] híváshoz szükséges beállításokat
class AlbumRepositoryRequest extends HTTPRequestHolder<List<AlbumModel>> {
  ///Megadja a [protokollt] ami lehet [HTTP] vagy [HTTPS].
  @override
  HTTPRequestProtocol get protocol => HTTPRequestProtocol.HTTP;

  ///Megadja a [hostot].
  @override
  String get host => 'jsonplaceholder.typicode.com';

  ///Megadja az [útvonalat].
  @override
  String get path => '/albums';

  ///Megadja a [HTTP] metódust ami lehet [GET], [POST], [PUT], [PATCH], [DELETE].
  @override
  HTTPRequestMethod get method => HTTPRequestMethod.GET;

  ///Megadja a [JSON] elemzőt ami lehet [LIST] vagy [MAP].
  @override
  JSONParserType get parserType => JSONParserType.LIST;

  ///A [listParser] függvény segítségével alakítja át a [JSON] választ [albumok] listájává.
  @override
  JSONListParser<List<AlbumModel>>? get listParser => (json) {
    return (json).map((e) => AlbumModel.fromJson(e)).toList();
  };

  @override
  HTTPRequestHolderSettings get settings {
    return HTTPRequestHolderSettings(
      isDebugPrint: true,
    );
  }
}