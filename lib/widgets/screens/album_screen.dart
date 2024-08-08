import 'package:mentoring001/mentoring001.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    super.initState();
    ///A [WidgetsBinding.instance.addPostFrameCallback] -et azért használjuk, hogy biztosítsuk, hogy a widget fa teljesen felépült, és a [context] teljesen elérhető.
    /// Az [albumProvider] sorral megszerezzük az [AlbumProvider] egy példányát a [provider] csomag segítségével.
    ///A [listen: false] azt jelenti, hogy nem akarunk változásokat figyelni, csak egyszeri hozzáférésre van szükségünk.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final albumProvider = Provider.of<AlbumProvider>(context, listen: false);
      albumProvider.fetchAlbums();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: const AlbumList(),
    );
  }
}
