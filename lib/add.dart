// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project1/Service/api_serives.dart';


class AddEmployeeView extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'Enter Employee ID'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                int id = int.tryParse(_idController.text) ?? 0;
                if (id != 0) {
                  try {
    await ApiService().createEmployee(id);
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Employee added successfully')),
    );
    } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Failed to add employee')),
    );
    }
    } else {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Please enter a valid ID')),
    );
    }
    },  child: Text('Add Employee'),

    )
    ]
    )
      )
    );
  }
}