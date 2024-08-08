import 'package:mentoring001/mentoring001.dart';

class AlbumRepositoryRequest extends HTTPRequestHolder<List<AlbumModel>> {
  @override
  HTTPRequestProtocol get protocol => HTTPRequestProtocol.HTTP;

  @override
  String get host => 'jsonplaceholder.typicode.com';

  @override
  String get path => '/albums';

  @override
  HTTPRequestMethod get method => HTTPRequestMethod.GET;

  @override
  JSONParserType get parserType => JSONParserType.LIST;

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