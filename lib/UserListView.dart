
// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:project1/Constants/UserController.dart';
import 'package:project1/Model/model.dart';


class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final UserController _controller = UserController();
  List<Employee> _users = []; // Store fetched users here

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Fetch users from the controller
      _users = await _controller.fetchUsers();
      setState(() {
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load users: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Get Data from json inside listview",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: _users.isEmpty
          ? const Text("لا يوجد بيانات")
          : ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context, int index) {
          Employee myItem = _users[index]; // Get user at the current index
          return Row(
            children: [
              Text(" Id : " + myItem.empId.toString()),
              Text(" - Name : " + myItem.empName.toString()),
              Text(" Date : " + myItem.empDate.toString()),
            ],
          );
        },
      ),
    );
  }
}
