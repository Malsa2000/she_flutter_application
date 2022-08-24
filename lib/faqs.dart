import 'package:flutter/material.dart';

import 'model/faqs_model.dart';
class Faqs extends StatefulWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {

  List<FaqsModel> _model = <FaqsModel>[
    FaqsModel(qustion: "qustion1", answer: "answer1"),
    FaqsModel(qustion: "qustion2", answer: "answer2"),
    FaqsModel(qustion: "qustion3", answer: "answer3"),
    FaqsModel(qustion: "qustion4", answer: "answer4"),

  ];
  bool _isExpanded =false;
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQS"),),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
        children: [


          ExpansionPanelList(
          expansionCallback:(panalIndex ,_isExpanded){
            setState(()=>_model[panalIndex].isExpanded = !_isExpanded );},



            children: _model.map((e) {
              return ExpansionPanel(body: Text(e.answer) ,
                                    headerBuilder:(context , _isExpanded ){return Text(e.qustion);},
                isExpanded: false,
                backgroundColor: Colors.lightBlueAccent,
                 canTapOnHeader: true,
              );}).toList()
          ),
        ],
      ),
    );
  }
}

