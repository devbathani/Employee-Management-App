import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_bloc.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_event.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_state.dart';
import 'package:realtime_innovation_assignment/modules/home/model/employee_entity.dart';
import 'package:realtime_innovation_assignment/routing/app_router.gr.dart';
import 'package:realtime_innovation_assignment/utils/colors.dart';
import 'package:realtime_innovation_assignment/utils/scaffold_messanger.dart';
import 'package:realtime_innovation_assignment/utils/text_styles.dart';

class EditEmployeeButtonWidget extends StatefulWidget {
  const EditEmployeeButtonWidget(
      {super.key, required this.employeeName, required this.employeeId});
  final String employeeName;
  final String employeeId;

  @override
  State<EditEmployeeButtonWidget> createState() =>
      _EditEmployeeButtonWidgetState();
}

class _EditEmployeeButtonWidgetState extends State<EditEmployeeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          height: 60.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: borderColor),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).pop();
                    },
                    child: Container(
                      height: 40.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: const Color(0xffEDF8FF),
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: subHeadingStyle.copyWith(
                            color: blueColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  InkWell(
                    onTap: () {
                      log(widget.employeeName);
                      if (widget.employeeName.isEmpty) {
                        showMessanger("Please add employee's name", context);
                      } else if (state.selectedRole == null) {
                        showMessanger("Please add employee's role", context);
                      } else {
                        context.read<HomeBloc>().add(
                              UpdateEmployee(
                                EmployeeEntity(
                                  employeeName: widget.employeeName,
                                  employeeRole: state.selectedRole,
                                  currentDate: state.currentDate,
                                  previousDate: state.previousDate,
                                  id: widget.employeeId,
                                ),
                              ),
                            );
                        if (context.mounted) {
                          showMessanger(
                              "Employee updated successfully", context);
                        }
                        context
                            .read<HomeBloc>()
                            .add(const DropDownChanged("Select role"));
                        context.read<HomeBloc>().add(AddCurrentDate(
                            DateFormat('dd MMM, yyyy').format(DateTime.now())));
                        context
                            .read<HomeBloc>()
                            .add(const AddPreviousDate("No date"));
                        AutoRouter.of(context).push(const HomeRoute());
                      }
                    },
                    child: Container(
                      height: 40.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: blueColor),
                      child: Center(
                        child: Text(
                          "Save",
                          style: subHeadingStyle.copyWith(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
