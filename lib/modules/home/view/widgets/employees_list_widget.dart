import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:realtime_innovation_assignment/injection/injection.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_bloc.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_event.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_state.dart';
import 'package:realtime_innovation_assignment/modules/home/model/employee_entity.dart';
import 'package:realtime_innovation_assignment/routing/app_router.gr.dart';
import 'package:realtime_innovation_assignment/utils/colors.dart';
import 'package:realtime_innovation_assignment/utils/scaffold_messanger.dart';
import 'package:realtime_innovation_assignment/utils/text_styles.dart';

class EmployeesListWidget extends StatefulWidget {
  const EmployeesListWidget({super.key, required this.employeeListData});
  final List<EmployeeEntity> employeeListData;

  @override
  State<EmployeesListWidget> createState() => _EmployeesListWidgetState();
}

class _EmployeesListWidgetState extends State<EmployeesListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: getIt<HomeBloc>(),
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: 200.h,
          width: MediaQuery.sizeOf(context).width,
          color: Colors.white,
          child: ListView.builder(
            itemCount: widget.employeeListData.length,
            itemBuilder: (context, index) {
              final data = widget.employeeListData[index];
              return InkWell(
                onTap: () {
                  AutoRouter.of(context).push(
                    EditEmployeeRoute(employeeEntity: data),
                  );
                },
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        flex: 2,
                        onPressed: (context) async {
                          getIt<HomeBloc>().add(DeleteEmployee(data.id!));
                          showUndoMessanger(
                              "Employee data has been deleted", context);
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete_forever_outlined,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: Container(
                    height: 95.h,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(bottom: BorderSide(color: borderColor)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.employeeName!,
                                style: headingStyle.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                data.employeeRole!,
                                style: subHeadingStyle.copyWith(
                                  fontSize: 14.sp,
                                  color: lightTextColor,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              data.previousDate == "No date"
                                  ? Text(
                                      "From ${data.currentDate!}",
                                      style: subHeadingStyle.copyWith(
                                        fontSize: 10.sp,
                                        color: lightTextColor,
                                      ),
                                    )
                                  : Text(
                                      "${data.currentDate} - ${data.previousDate}",
                                      style: subHeadingStyle.copyWith(
                                        fontSize: 10.sp,
                                        color: lightTextColor,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
