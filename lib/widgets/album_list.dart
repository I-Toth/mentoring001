import 'package:mentoring001/mentoring001.dart';

class AlbumList extends StatelessWidget {
  const AlbumList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AlbumProvider>(
      builder: (context, albumProvider, child) {
        return StreamHolderBuilder<List<AlbumModel>?>(
          streamHolder: albumProvider.albumsStreamHolder,
          builder: (context, state, data, error) {
            switch (state) {
              case StreamHolderState.none:
                return const Center(child: CircularProgressIndicator());
              case StreamHolderState.hasData:
                return ListView.builder(
                  itemCount: data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data![index].title),
                    );
                  },
                );
              case StreamHolderState.hasError:
                return Center(child: Text(error.toString()));
            }
          },
        );
      },
    );
  }
}
