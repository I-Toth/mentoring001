import 'package:mentoring001/mentoring001.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final album = Provider.of<AlbumProvider>(context, listen: false);
    album.fetchAlbums();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: const AlbumList(),
    );
  }
}
