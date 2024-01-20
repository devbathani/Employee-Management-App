// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:realtime_innovation_assignment/modules/home/model/employee_entity.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final bool isStateUpdated;

  final String? currentDate;
  final String? previousDate;
  final String? selectedRole;
  final List<EmployeeEntity> cureentEmployeeDataList;
  final List<EmployeeEntity> employeeDataList;
  final List<EmployeeEntity> previousEmployeeDataList;

  const HomeState({
    required this.isLoading,
    required this.isStateUpdated,
    this.currentDate,
    this.previousDate,
    this.selectedRole,
    required this.cureentEmployeeDataList,
    required this.employeeDataList,
    required this.previousEmployeeDataList,
  });
  @override
  List<Object?> get props =>
      [isLoading, currentDate, previousDate, selectedRole];

  HomeState copyWith({
    bool? isLoading,
    bool? isStateUpdated,
    String? currentDate,
    String? previousDate,
    String? selectedRole,
    List<EmployeeEntity>? cureentEmployeeDataList,
    List<EmployeeEntity>? employeeDataList,
    List<EmployeeEntity>? previousEmployeeDataList,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isStateUpdated: isStateUpdated ?? this.isStateUpdated,
      currentDate: currentDate ?? this.currentDate,
      previousDate: previousDate ?? this.previousDate,
      selectedRole: selectedRole ?? this.selectedRole,
      cureentEmployeeDataList:
          cureentEmployeeDataList ?? this.cureentEmployeeDataList,
      employeeDataList: employeeDataList ?? this.employeeDataList,
      previousEmployeeDataList:
          previousEmployeeDataList ?? this.previousEmployeeDataList,
    );
  }

  factory HomeState.initial() {
    return HomeState(
      isLoading: false,
      isStateUpdated: false,
      cureentEmployeeDataList: const [],
      previousEmployeeDataList: const [],
      employeeDataList: const [],
      currentDate: DateFormat('dd MMM, yyyy').format(DateTime.now()),
      previousDate: "No date",
    );
  }

  @override
  bool get stringify => true;
}
