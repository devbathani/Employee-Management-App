import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_bloc.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_event.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_state.dart';
import 'package:realtime_innovation_assignment/utils/colors.dart';
import 'package:realtime_innovation_assignment/utils/text_styles.dart';

class EmployeeRolesWidget extends StatefulWidget {
  const EmployeeRolesWidget({super.key});

  @override
  State<EmployeeRolesWidget> createState() => _EmployeeRolesWidgetState();
}

class _EmployeeRolesWidgetState extends State<EmployeeRolesWidget> {
  List<String> employeesRolesList = [
    "Product Designer",
    "Flutter Developer",
    "QA Tester",
    "Product Owner",
  ];
  String selectedRole = "Select role";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              context: context,
              builder: (context) {
                return Container(
                  height: 230.h,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Column(
                      children: List.generate(
                        employeesRolesList.length,
                        (index) {
                          final data = employeesRolesList[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<HomeBloc>()
                                    .add(DropDownChanged(data));

                                if (context.mounted) {
                                  AutoRouter.of(context).pop();
                                }
                                setState(() {});
                              },
                              child: Column(
                                children: [
                                  Text(
                                    data,
                                    style: subHeadingStyle.copyWith(
                                        color: darkTextColor),
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(
                                    thickness: 0.5.w,
                                    color: borderColor,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            height: 40.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Colors.white,
              border: Border.all(
                color: borderColor,
                width: 1.w,
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    const Icon(
                      Icons.work_outline_outlined,
                      color: blueColor,
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      state.selectedRole ?? selectedRole,
                      style: subHeadingStyle.copyWith(
                        color: state.selectedRole == "Select role"
                            ? lightTextColor
                            : darkTextColor,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: blueColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
