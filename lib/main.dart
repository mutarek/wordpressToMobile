import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_mobile/data/provider/home_provider.dart';
import 'package:wordpress_mobile/module/screen/home_page.dart';
import 'package:wordpress_mobile/module/splash/splash_provider.dart';

import 'di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<HomeProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
