import 'package:flutter/material.dart';

import 'model/faqs_model.dart';

class FaqsTest extends StatefulWidget {
  const FaqsTest({Key? key}) : super(key: key);

  @override
  State<FaqsTest> createState() => _FaqsTestState();
}

class _FaqsTestState extends State<FaqsTest> {
  List<FaqsModel> _faqs = <FaqsModel>[
    FaqsModel(qustion: "qustion1", answer: "answer1"),
    FaqsModel(qustion: "qustion2", answer: "answer2"),
    FaqsModel(qustion: "qustion3", answer: "answer3"),
    FaqsModel(qustion: "qustion4", answer: "answer4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: ListView.builder(
        itemCount: _faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(_faqs[index].qustion),
            leading: Icon(Icons.query_stats),

            //normal expantioal
            backgroundColor: Colors.limeAccent,
            textColor: Colors.lightBlueAccent,
            iconColor:Colors.lightBlueAccent ,

            //collabs=> when expanded
            collapsedBackgroundColor:Colors.lightBlueAccent ,
            collapsedIconColor:  Colors.limeAccent,
            collapsedTextColor:  Colors.limeAccent,
            onExpansionChanged: (bool value){
              
            },

            children: [Text(_faqs[index].answer)],
          );

        },

      ),
    );
  }
}
