import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_assignment/gen/assets.gen.dart';
import 'package:realtime_innovation_assignment/routing/app_router.gr.dart';
import 'package:realtime_innovation_assignment/utils/colors.dart';
import 'package:realtime_innovation_assignment/utils/text_styles.dart';

class HomeNoDateWidget extends StatelessWidget {
  const HomeNoDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: greyColor,
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text(
          "Employee List",
          style: headingStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.noDataPlaceholder.path,
                height: 200.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
