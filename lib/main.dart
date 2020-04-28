import 'package:flutter/material.dart';

import 'package:list_view/Screens/userList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('User List')),
        body: UserList(),
      ),
    );
  }
}
