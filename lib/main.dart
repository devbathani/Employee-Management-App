import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:realtime_innovation_assignment/core/prefs.dart';
import 'package:realtime_innovation_assignment/injection/injection.dart';
import 'package:realtime_innovation_assignment/routing/app_router.dart';
import 'package:realtime_innovation_assignment/utils/providers.dart';

void main() async {
  configureInjection(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: List.from(providers),
      child: ScreenUtilInit(
        designSize: const Size(380, 720),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            title: "Realtime Innovation Assignment",
          );
        },
      ),
    );
  }
}
