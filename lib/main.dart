import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:hackernewsapi/pages/home_page.dart';


void main() {
  runApp(ProviderScope(child: hackernews()));
}

class hackernews extends StatelessWidget {
  const hackernews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}