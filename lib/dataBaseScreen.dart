import 'package:sqflite/sqflite.dart';

var  database  ;
  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)')
            .then((value) {
          print('Database Created');
        }).catchError((error) {
          print('Error in creating database is ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database).then((value) {
        //  setState(() {
        //      tasks = value;
        //     print(tasks);
        // });
        });
        print('Database Opened');
      },
    );
  }

  Future insertToDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    return await database.transaction((txn) async {
      txn
          .rawInsert(
          'INSERT INTO tasks(title,date,time,status)VALUES("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted Successfully');
      }).catchError((error) {
        print('Error when inserting database is ${error.toString()}');
      });
      return null;
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }

////////////////////////////////////////////////////////

