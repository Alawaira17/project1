
//Model Class: This class represents the structure of an employee.  (make this class in models package)

class Employee {
final int empID;
final String empName;
final String empDate;

Employee({required this.empID, required this.empName, required this.empDate});

factory Employee.fromJson(Map<String, dynamic> json) {
return Employee(
empID: json['empID'],
empName: json['empName'],
empDate: json['empDate'],
);
}
}
