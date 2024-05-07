
import 'package:project1/Model/model.dart';
import 'package:project1/Service/api_serives.dart';

class UserController {
  final ApiService _apiService = ApiService();

  Future<List<Employee>> fetchUsers() async {
    try {
      return await _apiService.getAllEmployees();
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}
