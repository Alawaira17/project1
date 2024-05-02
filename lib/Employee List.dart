 // ignore_for_file: prefer_const_constructors

 import 'package:flutter/material.dart';
class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key, required text});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Employee", style: TextStyle(color: Colors.white)),
        elevation: 10.0,
        backgroundColor: const Color.fromARGB(255, 0, 138, 158),
        //elevation: 10.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        leading: const BackButton(
          color: Colors.white, // <-- SEE HERE
        ),

      ),



      body: SingleChildScrollView(
      child: Column(
      children: <Widget>[


      SizedBox(height: 40,),

    Card(
    child: ListTile(
    shape: RoundedRectangleBorder(
    side: const BorderSide(color: Colors.white, width: 4),
    borderRadius: BorderRadius.circular(15),
    ),

    subtitle: Column(
    children: const <Widget>[
    Icon(Icons.account_circle, size: 60.0, color: Colors.grey),
    Text('Employee Name:Ahmed'),
    Text('Employee Id:1234'),
    Text(' Date:17-1-2023 '),

    ],
    ),
    tileColor: Colors.grey[300],

    ),
    ),


    Card(
    child: ListTile(
    shape: RoundedRectangleBorder(
    side: const BorderSide(color: Colors.white, width: 4),
    borderRadius: BorderRadius.circular(15),
    ),

    subtitle: Column(
    children: const <Widget>[
    Icon(Icons.account_circle, size: 60.0, color: Colors.grey),
      Text('Employee Name:ramah'),
      Text('Employee Id:1234'),
      Text(' Date:17-9-2023 '),


    ],
    ),
    tileColor: Colors.grey[300],

    ),
    ),
    Card(
    child: ListTile(
    shape: RoundedRectangleBorder(
    side: const BorderSide(color: Colors.white, width: 4),
    borderRadius: BorderRadius.circular(15),
    ),

    subtitle: Column(
    children: const <Widget>[
    Icon(Icons.account_circle, size: 60.0, color: Colors.grey),
      Text('Employee Name:Aram'),
      Text('Employee Id:123412'),
      Text(' Date:10-3-2023 '),


    ],
    ),
    tileColor: Colors.grey[300],


    ),
    ),


    Card(
    child: ListTile(
    shape: RoundedRectangleBorder(
    side: const BorderSide(color: Colors.white, width: 4),
    borderRadius: BorderRadius.circular(15),
    ),

    subtitle: Column(
    children: const <Widget>[
    Icon(Icons.account_circle, size: 60.0, color: Colors.grey),
      Text('Employee Name:Ahmed'),
      Text('Employee Id:1234'),
      Text(' Date:3-6-2023 '),

    ],
    ),
    tileColor: Colors.grey[300],
    ),
    ),
    ],
    ),
      ),

    );
  }
}
