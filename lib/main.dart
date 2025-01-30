import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_media/controller/media_provider.dart';
import 'package:social_media/view/pages/add_page.dart';
import 'package:social_media/view/pages/new_post_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Open Hive box
  await Hive.openBox('mediaBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MediaProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewPostPage(),
      ),
    );
  }
}
