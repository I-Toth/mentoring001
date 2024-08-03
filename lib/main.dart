import 'package:mentoring001/mentoring001.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AlbumProvider>(create: (_) => AlbumProvider()),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
