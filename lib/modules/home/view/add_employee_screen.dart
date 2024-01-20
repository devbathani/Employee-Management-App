import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_assignment/core/extension.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/add_dates_widget.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/add_employee_button_widget.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/custom_textfield.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/employee_roles_widget.dart';
import 'package:realtime_innovation_assignment/utils/colors.dart';
import 'package:realtime_innovation_assignment/utils/text_styles.dart';

@RoutePage()
class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  TextEditingController employeeNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text(
          "Add Employee Details",
          style: headingStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Column(
              children: [
                CustomTextField(
                  autofocus: true,
                  hintText: "Add you name",
                  controller: employeeNameController,
                  prefix: const Icon(
                    Icons.person_outlined,
                    color: blueColor,
                  ),
                  onChanged: (value) {
                    employeeNameController.value =
                        employeeNameController.value.copyWith(
                      text: value.capitalizeFirstLetter(),
                      selection: TextSelection.collapsed(
                        offset: employeeNameController.text.length,
                      ),
                    );

                    setState(() {});
                  },
                ),
                SizedBox(height: 20.h),
                const EmployeeRolesWidget(),
                SizedBox(height: 20.h),
                const AddDatesWidget(),
              ],
            ),
          ),
          const Spacer(),
          AddEmployeeButtonWidget(employeeName: employeeNameController.text),
        ],
      ),
    );
  }
}
