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