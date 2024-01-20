import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_assignment/core/extension.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_bloc.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_event.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_state.dart';
import 'package:realtime_innovation_assignment/modules/home/model/employee_entity.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/custom_textfield.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/edit-employee-widgets/edit_employee_add_button.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/edit-employee-widgets/edit_employee_date.dart';
import 'package:realtime_innovation_assignment/modules/home/view/widgets/edit-employee-widgets/edit_employee_roles_widget.dart';
import 'package:realtime_innovation_assignment/routing/app_router.gr.dart';
import 'package:realtime_innovation_assignment/utils/colors.dart';
import 'package:realtime_innovation_assignment/utils/scaffold_messanger.dart';
import 'package:realtime_innovation_assignment/utils/text_styles.dart';

@RoutePage()
class EditEmployeeScreen extends StatefulWidget {
  const EditEmployeeScreen({super.key, required this.employeeEntity});
  final EmployeeEntity employeeEntity;

  @override
  State<EditEmployeeScreen> createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  TextEditingController employeeNameController = TextEditingController();
  @override
  void initState() {
    employeeNameController.text = widget.employeeEntity.employeeName!;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.isStateUpdated) {
          context.read<HomeBloc>().add(const UpdateStateEvent(false));
          showUndoMessanger("Employee deleted successfully", context);
          AutoRouter.of(context).push(const HomeRoute());
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: blueColor,
            title: Text(
              "Edit Employee Details",
              style: headingStyle.copyWith(
                color: Colors.white,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: InkWell(
                  onTap: () async {
                    context
                        .read<HomeBloc>()
                        .add(DeleteEmployee(widget.employeeEntity.id!));
                  },
                  child: const Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
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
                    EditEmployeeRolesWidget(
                      selectedRole: widget.employeeEntity.employeeRole!,
                    ),
                    SizedBox(height: 20.h),
                    EditDatesWidget(
                      currentDate: widget.employeeEntity.currentDate!,
                      previousDate: widget.employeeEntity.previousDate!,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              EditEmployeeButtonWidget(
                employeeName: employeeNameController.text,
                employeeId: widget.employeeEntity.id!,
              ),
            ],
          ),
        );
      },
    );
  }
}
