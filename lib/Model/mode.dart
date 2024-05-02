import 'dart:convert';

List<Employee> userModelFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String userModelToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  Employee({
    required this.empID,
    required this.empName,
    required this.empDate,
  });

  int empID;
  String empName;
  String empDate;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    empID: json["empID"],
    empName: json["empName"],
    empDate: json["empDate"],

  );

  Map<String, dynamic> toJson() => {
    "empID": empID,
    "empName": empName,
    "empDate": empDate,
  };
}
