import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:she_flutter_application/pref/shared_pref_controller.dart';

class LunchScreen extends StatefulWidget {


  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool logIn = SharedPreferanceController().getValueForKey(prefKey.languges.name) ??false;
    String rout = logIn ? '/home' : '/login';
    Future.delayed(Duration(seconds: 1),(){
      Navigator.pushNamed(context, rout);}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.amberAccent ,Colors.black]),

      ),
      child: Text("She Aplcaion " ,style: GoogleFonts.cairo(fontSize: 30),),
      ) );
  }
}
