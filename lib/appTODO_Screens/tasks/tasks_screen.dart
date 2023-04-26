

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/app_TODO_Tasks/States_Cubit_bloc/cubit.dart';
import 'package:flutter_app1/app_TODO_Tasks/States_Cubit_bloc/states.dart';
import 'package:flutter_app1/app_TODO_Tasks/myWidgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskScreen extends StatelessWidget {
  Widget build(BuildContext context) {
   return BlocConsumer<AppCubit , AppState>(
     listener: (context, state) {},
     builder: (context, state)
     {
var tasks = AppCubit.get(context).newtasks;
return ConditionalBuilder(condition: tasks.length>0 ,
  builder: (context) =>
      ListView.separated(
     itemBuilder:(context, index) {
       if(tasks[index]['status'] == 'new'){buildTaskItem(tasks[index] , context );} else null;
       print('task status ${tasks[index]['status']}');return buildTaskItem(tasks[index], context);},
     separatorBuilder:(context, index) => Padding(padding: const EdgeInsets.all(8.0),
       child: Container(width: double.infinity, height: 2.0, color: Colors.blue,),),
     itemCount: tasks.length,),
       fallback: (context) =>Center(child: CircularProgressIndicator())
       ) ;
     },

 );

  }}
