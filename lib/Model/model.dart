import 'dart:convert';
import 'package:intl/intl.dart';

class Employee {
      int empId;
      String empName;
      String empDate;

      Employee({
            required this.empId,
            required this.empName,
            required this.empDate,
      });

      // Deserialize JSON to Employee object
      factory Employee.fromJson(Map<String, dynamic> json) {
            return Employee(
                  empId: json["P_EMP_ID"],
                  empName: json["P_EMP_NAME"],
                  empDate: json["P_EMP_DATE"],
            );
      }

      // Serialize Employee object to JSON
      Map<String, dynamic> toJson() {
            return {
                  "P_EMP_ID": empId,
                  "P_EMP_NAME": empName,
                  "P_EMP_DATE": empDate, // Format date before serialization
            };
      }

      // Custom method to format date as "DD-MON-YYYY"
      String formatDate(DateTime date) {
            return DateFormat('dd-MMM-yyyy').format(date).toUpperCase();
      }
}


