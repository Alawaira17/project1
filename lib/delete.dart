import 'package:flutter/material.dart';
import 'package:project1/Service/api_serives.dart';

class DeleteEmployeeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _idController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'Employee ID'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                int id = int.tryParse(_idController.text) ?? 0;
                if (id != 0) {
                  try {
                    await ApiService().deleteEmployee(id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Employee deleted successfully')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed to delete employee')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid ID')),
                  );
                }
              },
              child: const Text('Delete Employee'),
            ),
          ],
        ),
      ),
    );
  }
}