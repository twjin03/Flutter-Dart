import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmark/provider/bookmark_provider.dart';
import 'package:bookmark/screens/bookmark_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookmarkProvider(),
      child: MaterialApp(
        title: '북마크 앱',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: BookmarkScreen(),
      ),
    );
  }
}