import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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

class User {
  String name, subtitle, img;
  User(this.name, this.subtitle, this.img);
  User.fromJson(Map<String, dynamic> json)
      : name = json['name']['first'] + ' ' + json['name']['last'],
        subtitle = json['login']['username'],
        img = json['picture']['medium'];
}

class _UserListState extends State<UserList> {
  bool loading;
  List<User> users;

  @override
  void initState() {
    users = [];
    loading = true;

    _loadUsers();
    super.initState();
  }

  void _loadUsers() async {
    final url = 'https://randomuser.me/api/?results=20 ';
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    debugPrint('aqui esta la data => $json');
    //log('aqui esta la data => $json');
    List<User> _users = [];
    for (var jsonUser in json['results']) {
      _users.add(User.fromJson(jsonUser));
    }
    setState(() {
      users = _users;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index].name),
          subtitle: Text(users[index].subtitle),
          //leading: Icon(Icons.supervised_user_circle),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(users[index].img),
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
