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
          decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter ,colors: [
            Colors.amber , Colors.white , Colors.black,])),
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
              Expanded(
                child: Column(children: [


              Row(
                children: [
                  button(
                      name: "C",
                      color: (0xFF413F42),
                      onActionFunction: () {
                        setState(() => _click("C"));
                      }),
                  button(
                      name: "AC",
                      color: (0xFF413F42),
                      onActionFunction: () {
                        setState(() => _click("0"));
                      }),
                  button(
                      name: "-",
                      color: (0xFF413F42),
                      onActionFunction: () {
                        setState(() => _click("-"));
                      }),
                  button(
                      name: "=",
                      color: (0xFF413F42),
                      onActionFunction: () {
                        setState(() => _click("="));
                      }),
                ],
              ),
              Row(
                children: [
                  button(
                      name: "1",
                      color: (0xFFFFC600),
                      onActionFunction: () {
                        setState(() => _click("1"));
                      }),
                  button(
                      name: "2",
                      color: (0xFFFFC600),
                      onActionFunction: () {
                        setState(() => _click("2"));
                      }),
                  button(
                      name: "3",
                      color: (0xFFFFC600),
                      onActionFunction: () {
                        setState(() => _click("3"));
                      }),
                  button(
                      name: "*",
                      color: (0xFF413F42),
                      onActionFunction: () {
                        setState(() => _click("*"));
                      }),
                ],
              ),
              Row(
                children: [
                  button(
                      name: "4",
                      color: (0xFFFFC600),
                      onActionFunction: () {
                        setState(() => _click("4"));
                      }),
                  button(
                      name: "5",
                      color: (0xFFFFC600),
                      onActionFunction: () {
                        setState(() => _click("5"));
                      }),
                  button(
                      name: "6",
                      color: (0xFFFFC600),
                      onActionFunction: () {
                        setState(() => _click("6"));
                      }),
                  button(
                      name: "+",
                      color: (0xFF413F42),
                      onActionFunction: () {
                        setState(() => _click("+"));
                      }),
                ],
              ),
              Row(
                children: [
                  button(
                      name: "7",
                      color: (0xFFFFC600),
                      onActionFunction: () {
                        setState(() => _click("7"));
                      }),
                  button(
                      name: "8",
                      color: (0xFFFFC600),
                      onActionFunction: () {
                        setState(() => _click("8"));
                      }),
                  button(
                      name: "9",
                      color: (0xFFFFC600),
                      onActionFunction: () {
                        setState(() => _click("9"));
                      }),
                  button(
                      name: "/",
                      color: (0xFF413F42),
                      onActionFunction: () {
                        setState(() => _click("/"));
                      }),
                ],
              ),
                ],),)
            ],
          ),
        ));
  }

}
