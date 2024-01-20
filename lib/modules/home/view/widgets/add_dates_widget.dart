import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:realtime_innovation_assignment/gen/assets.gen.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_bloc.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_state.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/current_date_widget.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/previous_date_widget.dart';
import 'package:realtime_innovation_assignment/utils/colors.dart';
import 'package:realtime_innovation_assignment/utils/text_styles.dart';

class AddDatesWidget extends StatefulWidget {
  const AddDatesWidget({super.key});

  @override
  State<AddDatesWidget> createState() => _AddDatesWidgetState();
}

class _AddDatesWidgetState extends State<AddDatesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const CurrentDateWidget();
                  },
                );
              },
              child: Container(
                height: 40.h,
                width: 140.w,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(Assets.icons.calendarIcon),
                        SizedBox(width: 10.w),
                        Text(
                          state.currentDate ==
                                  DateFormat('dd MMM, yyyy')
                                      .format(DateTime.now())
                              ? "Today"
                              : state.currentDate!,
                          style: subHeadingStyle.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: blueColor,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const PreviousDateWidget();
                  },
                );
              },
              child: Container(
                height: 40.h,
                width: 140.w,
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
