import 'package:bloc/bloc.dart';
import 'package:cis_task_2/constants.dart';
import 'package:cis_task_2/screens/home_layout.dart';
import 'package:cis_task_2/screens/second_screen.dart';
import 'package:cis_task_2/shared/cubit/app_cubit.dart';
import 'package:cis_task_2/shared/cubit/app_states.dart';
import 'package:cis_task_2/shared/cubit/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit(),
    child: BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  HomeLayout(),
            theme: ThemeData(
                scaffoldBackgroundColor: kBackgroundColor,
                iconTheme: const IconThemeData(
                  color: Colors.white,
                )));
      },
    ),
    );
  }
}
