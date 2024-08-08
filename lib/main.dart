import 'package:mentoring001/mentoring001.dart';

void main() {
  ///Fejlesztési módban a [fake repository]-t használjuk az alkalmazásban.
  final fakeAlbumRepository = FakeAlbumRepository();

  runApp(
    MultiProvider(
      providers: [
        ///A [repo] paraméter opcionális. Ha nincs megadva, akkor az eredeti [api] hívás teljesül
        ChangeNotifierProvider<AlbumProvider>(create: (_) => AlbumProvider(/*repo: fakeAlbumRepository*/)),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
