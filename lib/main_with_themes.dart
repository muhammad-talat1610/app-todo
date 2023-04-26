

import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/API_project/dio_helper.dart';
import 'package:flutter_app1/app_TODO_Tasks/States_Cubit_bloc/cubit.dart';
import 'package:flutter_app1/app_TODO_Tasks/States_Cubit_bloc/states.dart';
import 'package:flutter_app1/app_TODO_Tasks/task_screen_main.dart';


main(){
  runApp(myApp());
   new myApp();
DioHelper.init();
}
class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
create: (context) => AppCubit()..createDatabase(),
child: BlocConsumer<AppCubit, AppState>(
listener: (context, state) {},
builder: (context, state) {
  AppCubit AA = AppCubit.get(context);
return MaterialApp(
debugShowCheckedModeBanner: false,
home: taskScreens(),
theme: ThemeData(
textTheme: TextTheme(
bodyText1: TextStyle(
fontWeight: FontWeight.bold,
color: Colors.indigo,
fontSize: 17.0,
),
bodyText2: TextStyle(
fontWeight: FontWeight.bold,
color: Colors.cyan,
fontSize: 15.0,)),
primarySwatch: Colors.deepOrange,
appBarTheme: AppBarTheme(
backgroundColor: Colors.white,
iconTheme: IconThemeData(color: Colors.black),
    backwardsCompatibility: false,
systemOverlayStyle: SystemUiOverlayStyle(
statusBarColor: Colors.white,
statusBarIconBrightness: Brightness.dark),
titleTextStyle: TextStyle(
color: Colors.black,
fontWeight: FontWeight.bold,
fontSize: 25.0,
)
),
bottomNavigationBarTheme: BottomNavigationBarThemeData(
selectedItemColor: Colors.deepOrange,
backgroundColor: Colors.white,
type: BottomNavigationBarType.fixed,
),
scaffoldBackgroundColor: Colors.white,
floatingActionButtonTheme: FloatingActionButtonThemeData(
backgroundColor: Colors.deepOrange)),
);}));} //for App ToDo
 }