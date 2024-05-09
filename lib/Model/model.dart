
//Model Class: This class represents the structure of an employee.  (make this class in models package)
import 'dart:convert';

List<Employee> employeeFromJson(String str) => List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
      int empId;
      String? empName;
      DateTime? empDate;

      Employee({
            required this.empId,
            required this.empName,
            required this.empDate,
      });

      factory Employee.fromJson(Map<String, dynamic> json) => Employee(
            empId: json["emp_id"],
            empName: json["emp_name"],
            empDate: json["emp_date"] == null ? null : DateTime.parse(json["emp_date"]),
      );

      Map<String, dynamic> toJson() => {
            "P_EMP_ID": empId,
            "P_EMP_NAME": empName,
            "P_EMP_DATE": empDate?.toIso8601String(),
      };
}




/*class Employee {
final int empID;
final String empName;
final String empDate;

Employee(
    {required this.empID,
      required this.empName,
      required this.empDate});

factory Employee.fromJson(Map<String, dynamic> json) {
return Employee(

empID: json['emp_id']?? 0,
empName: json['emp_name'] ?? '',
empDate: json['emp_date'] ?? '',
);
}

Map<String, dynamic> toJson() {
      return {
            'P_EMP_ID': empID,
            'P_EMP_NAME': empName,
            'P_EMP_DATE': empDate,
      };
}
}*/

//empID: json['emp_id']?? 0,
//empName: json['emp_name'] ?? '',
//empDate: json['emp_date'] ?? '',

