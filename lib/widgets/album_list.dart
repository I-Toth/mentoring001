import 'package:mentoring001/mentoring001.dart';

class AlbumList extends StatelessWidget {
  const AlbumList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Search Albums',
              border: OutlineInputBorder(),
            ),
            onChanged: (query) {
              Provider.of<AlbumProvider>(context, listen: false).searchAlbums(query);
            },
          ),
        ),
        Expanded(
          child: Consumer<AlbumProvider>(
            builder: (context, albumProvider, child) {
              return StreamHolderBuilder<List<AlbumModel>?>(
                streamHolder: albumProvider.searchStreamHolder,
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
          ),
        ),
      ],
    );
  }
}
