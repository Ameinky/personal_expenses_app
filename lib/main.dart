import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses_app/widgets/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      //   scaffoldBackgroundColor: Color(0xff111328),
      //   fontFamily: 'OpenSans',
      //   appBarTheme: AppBarTheme(
      //     textTheme: ThemeData.light().textTheme.copyWith(
      //           titleMedium: TextStyle(
      //             fontFamily: 'OpenSans',
      //             fontSize: 20,
      //           ),
      //         ),
      //   ),
      // ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
