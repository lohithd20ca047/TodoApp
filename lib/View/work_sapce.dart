import 'package:flutter/material.dart';

import 'home_page.dart';

class WorkSapce extends StatelessWidget {
  const WorkSapce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
