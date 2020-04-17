import 'package:flutter/material.dart';

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

class UserList extends StatefulWidget {
  const UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List users;

  @override
  void initState() {
    users = ['primer user', 'segundo user', 'tercer user'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index]),
          subtitle: Text('subtitulo'),
          leading: Icon(Icons.supervised_user_circle),
        );
      },
      itemCount: users.length,
    );
  }
}
