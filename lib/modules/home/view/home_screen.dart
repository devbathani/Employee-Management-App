import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_bloc.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_event.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_state.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/common_header_widget.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/employees_list_widget.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/home_no_data_widget.dart';
import 'package:realtime_innovation_assignment/routing/app_router.gr.dart';
import 'package:realtime_innovation_assignment/utils/colors.dart';
import 'package:realtime_innovation_assignment/utils/text_styles.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc()..add(HomeInitizalize()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const HomeNoDateWidget();
            }

            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  AutoRouter.of(context).push(const AddEmployeeRoute());
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Icon(Icons.add),
              ),
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: blueColor,
                title: Text(
                  "Employee List",
                  style: headingStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonHeaderWidget(data: "Current employees"),
                  EmployeesListWidget(
                      employeeListData: state.cureentEmployeeDataList),
                  const CommonHeaderWidget(data: "Previous employees"),
                  EmployeesListWidget(
                      employeeListData: state.previousEmployeeDataList),
                  const Spacer(),
                  Container(
                    height: 70.h,
                    width: MediaQuery.sizeOf(context).width,
                    color: greyColor,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Swipe left to delete",
                              style: subHeadingStyle.copyWith(
                                  color: lightTextColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
