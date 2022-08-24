import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/country.dart';
import 'model/testchekbox.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool _click = false;
  RangeValues _rangeValues = const RangeValues(30, 80);
  String? _qustion;
  List<checkbox> _checkbox = <checkbox>[
    checkbox(title: "1"),
    checkbox(title: "2"),
    checkbox(title: "3"),
    checkbox(title: "4"),
    checkbox(title: "5"),
    checkbox(title: "6"),
    checkbox(title: "7"),
    checkbox(title: "8"),
  ];
  int? _id ;
  List<Country> _dropMenu = <Country>[
    Country(id: 1, title: "Gaza"),
    Country(id: 2, title: "nables"),
    Country(id: 3, title: "betlahem"),
    Country(id: 4, title: "ramalla"),
  ];

  @override
  Widget build(BuildContext context) {
    return  ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          SwitchListTile(
            inactiveThumbColor: Colors.purpleAccent,
            title: const Text(" Bluttoth"),
            subtitle: const Text("on/off "),
            activeColor: Colors.purple,
            value: _click,
            onChanged: (bool value) {
              setState(() => _click = value);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text("slider ",
              style: GoogleFonts.cairo(
                  fontSize: 20, color: Colors.purple.shade800)),
          RangeSlider(
            values: _rangeValues,
            max: 200,
            min: 10,
            divisions: 20,
            labels: RangeLabels(
                _rangeValues.start.toString(), _rangeValues.end.toString()),
            onChanged: (RangeValues value) {
              setState(() => _rangeValues = value);
            },
            activeColor: Colors.purple,
            inactiveColor: Colors.purpleAccent,
          ),
          const SizedBox(
            height: 20,
          ),
          Text("RadioButton ",
              style: GoogleFonts.cairo(
                  fontSize: 20, color: Colors.purple.shade800)),
          Wrap(
            children: [
              RadioListTile(
                  tileColor: Colors.purple,
                  title: const Text('yes Qustions'),
                  value: 'y',
                  groupValue: _qustion,
                  onChanged: (String? value) {
                    setState(() => _qustion = value);
                  }),
              RadioListTile(
                  tileColor: Colors.purple,
                  title: const Text('No Qustions'),
                  value: 'n',
                  groupValue: _qustion,
                  onChanged: (String? value) {
                    setState(() => _qustion = value);
                  }),
              RadioListTile(
                  tileColor: Colors.purple,
                  title: const Text('maybe Qustions'),
                  value: 'm',
                  groupValue: _qustion,
                  onChanged: (String? value) {
                    setState(() => _qustion = value);
                  }),
              RadioListTile(
                  tileColor: Colors.purple,
                  title: const Text('dont Know Qustions'),
                  value: 'd',
                  groupValue: _qustion,
                  onChanged: (String? value) {
                    setState(() => _qustion = value);
                  }),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text("checkBox ",
              style: GoogleFonts.cairo(
                  fontSize: 20, color: Colors.purple.shade800)),
          for (checkbox c in _checkbox)
            CheckboxListTile(
                title: Text(c.title),
                activeColor: Colors.purple,
                tileColor: Colors.purple.shade50,
                value: c.isCkecked,
                onChanged: (bool? value) {
                  if (value != null) {
                    setState(() => c.isCkecked = value);
                  }
                }),

          const SizedBox(
            height: 20,
          ),
          Text("DropdownButton ",
              style: GoogleFonts.cairo(
                  fontSize: 20, color: Colors.purple.shade800)),
          DropdownButton<int>(
            icon: const Icon(Icons.countertops),
            isExpanded: true,
           hint: const Text("Select your country"),
            style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.w700 ,color: Colors.purple),
            value:_id ,
              onChanged: (int? vlaue) {
                setState(() => _id = vlaue);

              },
              items: _dropMenu
                  .map((Country) => DropdownMenuItem<int>(
                        child: Text(Country.title),
                value:Country.id ,
                      ))
                  .toList()),
        ],
    );
  }
}
