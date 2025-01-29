import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/controller/image_provider.dart';
import 'package:social_media/view/pages/home_page.dart';
import 'package:social_media/view/pages/new_post_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ ChangeNotifierProvider(
          create: (context) => KImageProvider(),
        ),],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      home: NewPostPage()
      ),
    );
  }
}

