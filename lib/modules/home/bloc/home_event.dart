import 'package:equatable/equatable.dart';
import 'package:realtime_innovation_assignment/modules/home/model/employee_entity.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class HomeInitizalize extends HomeEvent {}

class DropDownChanged extends HomeEvent {
  final String selectedValue;

  const DropDownChanged(this.selectedValue);

  @override
  List<Object> get props => [selectedValue];
}

class CurrentDateEvent extends HomeEvent {
  final String selectedDate;

  const CurrentDateEvent(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}

class PreviousDateEvent extends HomeEvent {
  final String selectedDate;

  const PreviousDateEvent(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}

class UpdateStateEvent extends HomeEvent {
  final bool updateState;

  const UpdateStateEvent(this.updateState);

  @override
  List<Object> get props => [updateState];
}

class AddEmployee extends HomeEvent {
  final EmployeeEntity employeeEntity;
  const AddEmployee(this.employeeEntity);
}

class DeleteEmployee extends HomeEvent {
  final String employeeId;
  const DeleteEmployee(this.employeeId);
}

class UpdateEmployee extends HomeEvent {
  final EmployeeEntity employeeEntity;
  const UpdateEmployee(this.employeeEntity);
}

class UndoDeleteEmployeeEvent extends HomeEvent {}

class AddTodayDate extends HomeEvent {
  final bool isCurrentDate;
  const AddTodayDate(this.isCurrentDate);
}

class AddCurrentDate extends HomeEvent {
  final String currentDate;
  const AddCurrentDate(this.currentDate);
}

class AddPreviousDate extends HomeEvent {
  final String previousDate;
  const AddPreviousDate(this.previousDate);
}

class AddNextMondayDate extends HomeEvent {}

class AddNextTuesdayDate extends HomeEvent {}

class AddAfterOneWeekDate extends HomeEvent {}

class HomeError extends HomeEvent {}
