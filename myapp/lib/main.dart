// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:myapp/pokemon_list.dart';
import 'package:myapp/my_bottom_navigation.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyBottomNavigation(),
    );
  }
}
