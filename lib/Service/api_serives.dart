// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:project1/Model/mode.dart';





class ApiService{
  Future<List<Employee>> getAllEmployees() async {
    final response = await http.get(Uri.parse(
        'https://apex.oracle.com/pls/apex/alqarar_ws/emp_tbt//emp_tbt/'));
    if (response.statusCode == 200) {
      Iterable jsonList = jsonDecode(response.body);
      return jsonList.map((employee) => Employee.fromJson(employee)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }


  Future<Employee> getEmployeeById(int id) async {
    final response = await http.get(Uri.parse(
        'https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/'));
    if (response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load employee');
    }
  }


  Future<void> createEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse('https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/'),
      body: jsonEncode(employee),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create employee');
    }
  }


  Future<void> updateEmployee(Employee employee) async {

/*P_EMP_ID this parameter is the same parameter which we are writing when we call the api in postman*/
    final response = await http.put(
      Uri.parse('https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/'),
      //?P_EMP_ID=${employee.empID}');
      body: jsonEncode(employee),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update employee');
    }
  }

  Future<void> deleteEmployee(int id) async {

/*P_EMP_ID this parameter is the same parameter which we are writing when we call the api in postman*/
    final response = await http.delete(Uri.parse(
        'https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/')); //?P_EMP_ID=$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete employee');
    }
  }

}

/*

1- Service Class: This class will handle all API calls.

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_app_name/models/employee.dart';

class ApiService {
  /*This URL for verbs GetByID, Post, Put, and Delete*/
  static const String baseUrlForEmp_tb = 'https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/';

 /*This URL for verbs Get all employees*/
  static const String baseUrlForEmp_tbt = 'https://apex.oracle.com/pls/apex/alqarar_ws/emp_tbt//emp_tbt/';

/*This method to call api which get all employees*/

  Future<List<Employee>> getAllEmployees() async {
    final response = await http.get(Uri.parse('$baseUrlForEmp_tbt'));
    if (response.statusCode == 200) {
      Iterable jsonList = jsonDecode(response.body);
      return jsonList.map((employee) => Employee.fromJson(employee)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

/*This method to call api which get employee by ID*/

  Future<Employee> getEmployeeById(int id) async {
    final response = await http.get(Uri.parse('$baseUrlForEmp_tb?id=$id'));
    if (response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load employee');
    }
  }

/*This method to call api which insert/add new employee */

  Future<void> createEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse('$baseUrlForEmp_tb'),
      body: jsonEncode(employee),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create employee');
    }
  }

/*This method to call api which update/modify employee detail*/

  Future<void> updateEmployee(Employee employee) async {

/*P_EMP_ID this parameter is the same parameter which we are writing when we call the api in postman*/
    final response = await http.put(Uri.parse('$baseUrlForEmp_tb?P_EMP_ID=${employee.empID}'),
      body: jsonEncode(employee),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update employee');
    }
  }

/*This method to call api which delete employee detail*/

  Future<void> deleteEmployee(int id) async {

/*P_EMP_ID this parameter is the same parameter which we are writing when we call the api in postman*/
    final response = await http.delete(Uri.parse('$baseUrlForEmp_tb?P_EMP_ID=$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete employee');
    }
  }
}


 */
