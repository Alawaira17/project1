// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project1/Model/model.dart';
import 'package:project1/Service/api_serives.dart';

// Import your Employee model class

class AddEmployeeView extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

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
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Enter Employee Name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(labelText: 'Enter Employee Date (YYYY-MM-DD)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                int id = int.tryParse(_idController.text) ?? 0;
                String name = _nameController.text.trim();
                String dateStr = _dateController.text.trim();

                if (id != 0 && name.isNotEmpty && dateStr.isNotEmpty) {
                  try {
                    DateTime date = DateFormat('yyyy-MM-dd').parse(dateStr);
               //     Employee employee = Employee(empID: id, empName: name, empDate: dateStr);
                //    await ApiService().createEmployee(employee);

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
                    SnackBar(content: Text('Please enter valid details')),
                  );
                }
              },
              child: Text('Add Employee'),
            ),
          ],
        ),
      ),
    );
  }
}