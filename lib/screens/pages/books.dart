import 'package:flutter/material.dart';

class books extends StatelessWidget {
  const books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Books")),
      ),
    );
  }
}
