import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:she_flutter_application/Whidget/button.dart';

class Calclator extends StatefulWidget {
  const Calclator({Key? key}) : super(key: key);

  @override
  State<Calclator> createState() => _CalclatorState();
}

class _CalclatorState extends State<Calclator> {

  String oop = '';
  int first =0 ;
  int second =0 ;
  String result = "0";
  String text = "0";

  void _click(String btnText) {
    if(btnText =="C"){
       first =0 ;
       second =0 ;
       result = "0";
       text = "0";
    }else if(btnText =="+" || btnText =="*" || btnText =="-" || btnText =="/"){
        //save value:
      first =int.parse(text);
      result ="";
      oop = btnText;
    }
    else if(btnText =="="){
      second ==int.parse(text);
      if(oop == "+"){
        result = (first +second).toString();
      }
     else if(oop == "*"){
        result = (first * second).toString();
      }
    else  if(oop == "/"){
        result = (first /second).toString();
      }}
    else {
      result = int.parse(text + btnText).toString();
    }
    setState(()=> text= result);

  }
  Widget button2(String value){
    return ElevatedButton(onPressed:()=> _click(value),
        child: Text(value ,style: GoogleFonts.cairo(fontSize: 20),));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calclator",
              style: GoogleFonts.cairo(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,

                  textAlign: TextAlign.right,
                  style: GoogleFonts.cairo(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(result,
                  style: GoogleFonts.cairo(
                      color: Colors.amber,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                button2("C"),
                  button2("="),
                  button2("/"),
                  button2("*"),

                ],
              ),
              Row(
                children: [
                  button2("1"),
                  button2("2"),
                  button2("3"),
                  button2("*"),

                ],
              ),
              Row(
                children: [
                  button2("6"),
                  button2("4"),
                  button2("5"),
                  button2("+"),

                ],
              ),
              Row(
                children: [
                  button2("7"),
                  button2("8"),
                  button2("9"),
                  button2("-"),

                ],
              ),
            ],
          ),
        ));
  }


}
