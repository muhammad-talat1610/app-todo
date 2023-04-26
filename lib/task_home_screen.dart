import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/app_TODO_Tasks/States_Cubit_bloc/cubit.dart';
import 'package:flutter_app1/app_TODO_Tasks/States_Cubit_bloc/states.dart';
import 'package:flutter_app1/app_TODO_Tasks/myWidgets.dart';
import 'package:intl/intl.dart';

class taskScreens extends StatelessWidget {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  Widget build(BuildContext context) {

    return BlocProvider(
          create: (context) => AppCubit()..createDatabase(),
          child:BlocConsumer<AppCubit, AppState>(listener: (context, state) {
        if (state is insertDataBaseState) {
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        AppCubit AA = AppCubit.get(context);

        return Scaffold(
          key: scaffoldkey,
          appBar: AppBar(
            //backgroundColor: Colors.deepOrangeAccent,
            title: Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0)),
                    )),
                Center(
                    child: Text(AA.titles[AA.currentIndex],
                    style: TextStyle(color: Colors.deepOrangeAccent , ),))
              ],
            ),
            actions: [
              IconButton(iconSize: 30.0,
                  onPressed:(){
                    AA.changeAppMode();
                  },
                  icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: ConditionalBuilder(
            condition: AA.screens.length > 0, //AA.screens.isNotEmpty,

            fallback: (context) => Center(child:CircularProgressIndicator()),
            builder: (BuildContext context) {
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0)),
                      )),
                ],
              );
              return AA.screens[AA.currentIndex];
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrangeAccent,
            onPressed: () {
              if (AA.isBottomSheetShown) {
                if (formKey.currentState!.validate()) {
                  AA.insertToDatabase(
                      title: titleController.text,
                      date: dateController.text,
                      time: timeController.text);
                }
              } else {
                scaffoldkey.currentState!
                    .showBottomSheet(
                      (context) => Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultTextFromField(
                            controller: titleController,
                            typeOfText: TextInputType.text,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'title must not be empty';
                              }
                              return null;
                            },
                            label: 'Task Title',
                            prefix: Icons.title,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          defaultTextFromField(
                            controller: timeController,
                            typeOfText: TextInputType.datetime,
                            onTap: () {
                              showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                                  .then((value) {
                                timeController.text =
                                    value!.format(context).toString();
                              });
                            },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'time must not be empty';
                              }
                              return null;
                            },
                            label: 'Time Title',
                            prefix: Icons.watch_later_outlined,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          defaultTextFromField(
                            controller: dateController,
                            typeOfText: TextInputType.datetime,
                            onTap: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2025))
                                  .then((value) {
                                dateController.text = DateFormat.yMMMd()
                                    .format(value!)
                                    .toString();
                              });
                            },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'date must not be empty';
                              }
                              return null;
                            },
                            label: 'Date Title',
                            prefix: Icons.calendar_today,
                          ),
                        ],
                      ),
                    ),
                  ),
                  elevation: 20.0,
                )
                    .closed
                    .then((value) {
                  AA.isBottomSheet(icon: Icons.edit, showIt: false);

                  // isBottomSheetShown = false;
                  // setState(() {
                  //   fabIcon = Icons.edit;
                  // });
                });
                AA.isBottomSheet(icon: Icons.add, showIt: true);
                // isBottomSheetShown = true;
                // setState(() {
                //   fabIcon = Icons.add;
                // });
              }
              return null;
            },
            child: Icon(AA.fabIcon),
          ),
          bottomNavigationBar: BottomNavigationBar(
//             selectedItemColor: Colors.cyanAccent,
// unselectedItemColor: Colors.indigo,
// backgroundColor: Colors.deepOrangeAccent,
            type: BottomNavigationBarType.fixed,
            currentIndex: AA.currentIndex,
            onTap: (index) {
              AA.changeBNBar(index);
              // setState(() {
              //   currentIndex = index;
              // });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline),
                label: 'Done',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined),
                label: 'Archived',
              ),
            ],
          ),
        );
      })
    );
  }
}

