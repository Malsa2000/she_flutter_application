import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class button extends StatelessWidget {
 final String name ;
 final int color;
 final void Function() onActionFunction;

  const button({
    required this.name,
    required  this.color,
    required this.onActionFunction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: ElevatedButton(onPressed: onActionFunction, child: Text(name ,
          style: GoogleFonts.cairo(color: Colors.white, fontSize :20 ,fontWeight: FontWeight.bold),) ,
            style: ElevatedButton.styleFrom(primary: Color(color) , maximumSize: Size(70, 60) ,elevation: 5)),
      ),
    );
  }
}