import 'package:flutter/material.dart';
import 'package:project1/Service/api_serives.dart';


class ModifyEmployeeView extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modify Employee'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'Enter Employee ID'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                int id = int.tryParse(_idController.text) ?? 0;
                if (id != 0) {
                  try {
                    await ApiService().updateEmployee(id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Employee modified successfully')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to modify employee')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid ID')),
                  );
                }
              },
              child: Text('Modify Employee'),
            ),
          ],
        ),
      ),
    );
  }
}