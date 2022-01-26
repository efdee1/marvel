import 'package:flutter/material.dart';
import 'package:marvel/route.dart';
import 'package:marvel/ui/view/home.dart';

import 'locator.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await setupLocator();
    runApp(const MyApp());
  } catch (error) {
    print(error);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel',
      theme:ThemeData() ,
      routes: routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      },
    );
  }
}

