import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:realtime_innovation_assignment/core/database.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_event.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_state.dart';
import 'package:realtime_innovation_assignment/modules/home/model/employee_entity.dart';
import 'package:realtime_innovation_assignment/utils/logger.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<EmployeeEntity> employeeListData = [];
  final dbHelper = EmployeeDatabaseHelper();
  HomeBloc() : super(HomeState.initial()) {
    on<HomeInitizalize>((event, emit) async {
      logger.f("Checking");
      final employees = await dbHelper.getEmployees();
      final List<EmployeeEntity> employeeListDate =
          employees.map((item) => EmployeeEntity.fromJson(item)).toList();

      List<EmployeeEntity> currentEmployeeData = [];
      List<EmployeeEntity> previousEmployeeData = [];

      for (var employee in employeeListDate) {
        if (employee.previousDate == "No date") {
          currentEmployeeData.add(employee);
        } else {
          previousEmployeeData.add(employee);
        }
      }

      if (employeeListDate.isEmpty) {
        emit(
          state.copyWith(isLoading: true),
        );
      } else {
        logger.i(employeeListDate);
        emit(
          state.copyWith(
            cureentEmployeeDataList: currentEmployeeData,
            previousEmployeeDataList: previousEmployeeData,
            isLoading: false,
          ),
        );
      }
    });

    on<AddEmployee>((event, emit) async {
      await dbHelper.insertEmployee(event.employeeEntity.toJson());
      logger.i("Added successfully");
    });
    on<UpdateEmployee>((event, emit) async {
      logger.i(event.employeeEntity.employeeName);
      await dbHelper.updateEmployee(event.employeeEntity.toJson());
      logger.i("Updated successfully");
    });

    on<DeleteEmployee>((event, emit) async {
      await dbHelper.deleteEmployee(event.employeeId);
      emit(state.copyWith(isStateUpdated: true));
      logger.i("Deleted successfully");
    });
    on<UpdateStateEvent>((event, emit) async {
      emit(state.copyWith(isStateUpdated: event.updateState));
    });

    on<UndoDeleteEmployeeEvent>((event, emit) async {
      await dbHelper.undoDelete();
      emit(state.copyWith(isStateUpdated: true));
      logger.i("Undo Deleted successfully");
    });

    on<DropDownChanged>((event, emit) async {
      logger.i(event.selectedValue);
      emit(state.copyWith(selectedRole: event.selectedValue));
    });

    on<CurrentDateEvent>((event, emit) {
      logger.i(event.selectedDate);
      emit(state.copyWith(currentDate: event.selectedDate));
    });

    on<PreviousDateEvent>((event, emit) {
      logger.i(event.selectedDate);
      emit(state.copyWith(previousDate: event.selectedDate));
    });

    on<AddCurrentDate>((event, emit) {
      emit(
        state.copyWith(currentDate: event.currentDate),
      );
    });
    on<AddPreviousDate>((event, emit) {
      emit(
        state.copyWith(previousDate: event.previousDate),
      );
    });

    on<AddTodayDate>((event, emit) {
      if (event.isCurrentDate) {
        final date = DateFormat('dd MMM, yyyy').format(DateTime.now());
        emit(
          state.copyWith(currentDate: date),
        );
      } else {
        logger.i("In previous date");
        final date = DateFormat('dd MMM, yyyy').format(DateTime.now());
        emit(
          state.copyWith(previousDate: date),
        );
      }
    });
    on<AddNextMondayDate>((event, emit) {
      DateTime nextMonday = DateTime.now()
          .add(Duration(days: ((8 - DateTime.now().weekday) % 7)));

      final date = DateFormat('dd MMM, yyyy').format(nextMonday);
      emit(
        state.copyWith(currentDate: date),
      );
    });
    on<AddNextTuesdayDate>((event, emit) {
      DateTime nextTuesday = DateTime.now().add(Duration(
          days: ((DateTime.tuesday - DateTime.now().weekday + 7) % 7)));
      final date = DateFormat('dd MMM, yyyy').format(nextTuesday);
      emit(
        state.copyWith(currentDate: date),
      );
    });
    on<AddAfterOneWeekDate>((event, emit) {
      DateTime dateAfterOneWeek = DateTime.now().add(const Duration(days: 7));
      final date = DateFormat('dd MMM, yyyy').format(dateAfterOneWeek);
      emit(
        state.copyWith(currentDate: date),
      );
    });
  }
}
