

import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/app_TODO_Tasks/States_Cubit_bloc/cubit.dart';
import 'package:flutter_app1/app_TODO_Tasks/States_Cubit_bloc/states.dart';
import 'package:flutter_app1/app_TODO_Tasks/myWidgets.dart';
class ArchiveScreen extends StatelessWidget {
  Widget build(BuildContext context) {
  return BlocConsumer<AppCubit , AppState>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var tasks = AppCubit.get(context).archivedtasks;
        return ListView.separated(
          itemBuilder:(context, index)//=>buildTaskItem(tasks[index], context),
          { //print('task status ${tasks[index]}');
          return  buildTaskItem(tasks[index], context);},
          separatorBuilder:(context, index) =>
              Padding(padding: const EdgeInsets.all(8.0),
                child: Container(width: double.infinity, height: 2.0, color: Colors.blue,),),
          itemCount: tasks.length,);},
    );

  }}
