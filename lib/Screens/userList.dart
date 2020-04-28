import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:list_view/Models/countriesModels.dart';

import 'package:list_view/Models/user.dart';

class UserList extends StatefulWidget {
  const UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  bool loading;
  List<User> users;
  List<Country> response;

  @override
  void initState() {
    response = [];
    users = [];
    loading = true;

    _loadUsers();
    super.initState();
  }

  void getPaises() async {
    final _url = 'https://api.covid19api.com/summary';

    final resp = await http.get(_url);
    final decodedData = json.decode(resp.body);

    List<Country> _data;
    _data = [];
    for (var item in decodedData['Countries']) {
      _data.add(Country.fromJsonMap(item));
    }

    setState(() {
      response = _data;
      loading = false;
    });
  }

  void _loadUsers() async {
    final url = 'https://randomuser.me/api/?results=20 ';
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    //debugPrint('aqui esta la data => $json');
    //log('aqui esta la data => $json');
    List<User> _users = [];
    for (var jsonUser in json['results']) {
      _users.add(User.fromJson(jsonUser));
    }

    print('esto ess GAAAAAAAAAAAAAAAAAAAA => $_users[0]');
    //_users.sort((a,b) => a['age'])
    //debugPrint('aqui esta la data => $_users');
    setState(() {
      users = _users;
      //debugPrint('aqui esta la data => $users');
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
          //title: Text(users[index].name),
          subtitle: Text(users[index].age.toString()),
          //subtitle: Text(users[index].subtitle),
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
