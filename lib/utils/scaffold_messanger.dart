import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_bloc.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_event.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_state.dart';
import 'package:realtime_innovation_assignment/utils/colors.dart';
import 'package:realtime_innovation_assignment/utils/text_styles.dart';

showMessanger(String message, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: headingStyle.copyWith(
          color: Colors.white,
          fontSize: 14.sp,
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: darkTextColor,
    ),
  );
}

showUndoMessanger(String message, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.isStateUpdated) {
            context.read<HomeBloc>().add(const UpdateStateEvent(false));
            context.read<HomeBloc>().add(HomeInitizalize());
          }
        },
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                message,
                style: headingStyle.copyWith(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  context.read<HomeBloc>().add(UndoDeleteEmployeeEvent());
                },
                child: Text(
                  "Undo",
                  style: subHeadingStyle.copyWith(
                    color: blueColor,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: darkTextColor,
    ),
  );
}
