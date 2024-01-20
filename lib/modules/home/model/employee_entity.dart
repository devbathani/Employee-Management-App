// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmployeeEntity {
  String? employeeName;
  String? employeeRole;
  String? currentDate;
  String? previousDate;
  String? id;

  EmployeeEntity({
    this.employeeName,
    this.employeeRole,
    this.currentDate,
    this.previousDate,
    this.id,
  });

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) => EmployeeEntity(
        employeeName: json["employee_name"],
        employeeRole: json["employee_role"],
        currentDate: json["currentDate"],
        previousDate: json["previousDate"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "employee_name": employeeName,
        "employee_role": employeeRole,
        "currentDate": currentDate,
        "previousDate": previousDate,
        "id": id,
      };

  EmployeeEntity copyWith({
    String? employeeName,
    String? employeeRole,
    String? currentDate,
    String? previousDate,
    String? id,
  }) {
    return EmployeeEntity(
      employeeName: employeeName ?? this.employeeName,
      employeeRole: employeeRole ?? this.employeeRole,
      currentDate: currentDate ?? this.currentDate,
      previousDate: previousDate ?? this.previousDate,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return 'EmployeeEntity(employeeName: $employeeName, employeeRole: $employeeRole, currentDate: $currentDate, previousDate: $previousDate, id: $id)';
  }
}
