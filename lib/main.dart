import 'package:filmes/themes/dark.theme.dart';
import 'package:flutter/material.dart';
import 'package:filmes/pages/home.page.dart';
//import 'package:filmes/themes/light.theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lucas Filmes',
      debugShowCheckedModeBanner: false,
      theme: darkTheme(),
      home: HomePage(),
    );
  }
}
