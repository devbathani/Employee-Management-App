import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_innovation_assignment/modules/home/bloc/home_bloc.dart';

final providers = [
  BlocProvider<HomeBloc>(
    create: (context) => HomeBloc(),
  ),
];
