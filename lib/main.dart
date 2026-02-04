import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:universidades_app/providers/university_page_provider.dart';

import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      
        ChangeNotifierProvider(
          create: (context) => UniversityPageProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Universidades App',
        initialRoute: 'login_page',
        routes: {
          'login_page': (_) => const LoginPage(),
          'home_page': (_) => const HomePage(),
          'detail_page':(_) => const DetailPage(),
        },
      ),
    );
  }
}
