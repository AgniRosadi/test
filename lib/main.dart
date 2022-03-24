import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'helper/ui/app_color.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: AppRoute.rMain,
      theme: ThemeData(
          primarySwatch: AppColor.mainTheme,
          primaryTextTheme: Theme
              .of(context)
              .textTheme
              .apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          )),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _toPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(color: Theme
        .of(context)
        .primaryColor, child: Center(child: Text("Pendekar", style: GoogleFonts.mochiyPopOne(fontSize: 35, color: Colors.white),),));
  }
}

Future<void> _toPage(BuildContext context) async {
  Future.delayed(const Duration(milliseconds: 200), () async {
    Navigator.pushReplacementNamed(context, AppRoute.rNavigator);
  });
}

