import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:realtime_innovation_assignment/gen/assets.gen.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_bloc.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_event.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_state.dart';
import 'package:realtime_innovation_assignment/utils/colors.dart';
import 'package:realtime_innovation_assignment/utils/text_styles.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../injection/injection.dart';

class PreviousDateWidget extends StatefulWidget {
  const PreviousDateWidget({super.key});

  @override
  State<PreviousDateWidget> createState() => _PreviousDateWidgetState();
}

class _PreviousDateWidgetState extends State<PreviousDateWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Container(
            height: 460.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: SizedBox(
                      height: 50.h,
                      child: GridView.builder(
                        itemCount: 2,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 15.h,
                          childAspectRatio: 28 / 9,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                getIt<HomeBloc>().add(const AddPreviousDate("No date"));
                              } else if (index == 1) {
                                getIt<HomeBloc>().add(const AddTodayDate(false));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffEDF8FF),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Center(
                                child: Text(
                                  index == 0 ? "No date" : "Today",
                                  style: subHeadingStyle.copyWith(color: blueColor, fontSize: 14.sp),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  TableCalendar(
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month',
                    },
                    calendarFormat: CalendarFormat.month,
                    currentDay: _selectedDay,
                    daysOfWeekVisible: false,
                    firstDay: DateTime.now(),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: _focusedDay,
                    headerStyle: HeaderStyle(
                      titleTextStyle: headingStyle.copyWith(
                        color: darkTextColor,
                      ),
                      leftChevronIcon: Icon(
                        Icons.arrow_left,
                        color: lightTextColor,
                        size: 20.w,
                      ),
                      rightChevronIcon: Icon(
                        Icons.arrow_right,
                        color: lightTextColor,
                        size: 20.w,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      todayTextStyle: subHeadingStyle.copyWith(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                      todayDecoration: const BoxDecoration(
                        color: blueColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                        _selectedDay = selectedDay;
                        getIt<HomeBloc>().add(
                          AddPreviousDate(
                            DateFormat('dd MMM, yyyy').format(selectedDay),
                          ),
                        );
                      });
                    },
                  ),
                  const Spacer(),
                  Container(
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
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(Assets.icons.calendarIcon),
                            SizedBox(width: 10.w),
                            Text(
                              state.previousDate!,
                              style: subHeadingStyle.copyWith(
                                fontSize: 14.sp,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                AutoRouter.of(context).pop();
                              },
                              child: Container(
                                height: 40.h,
                                width: 60.w,
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
                            SizedBox(width: 5.w),
                            InkWell(
                              onTap: () {
                                AutoRouter.of(context).pop();
                              },
                              child: Container(
                                height: 40.h,
                                width: 60.w,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: blueColor),
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
