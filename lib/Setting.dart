import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/clothes.dart';
import 'model/country.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _check = false;
  RangeValues _rangevalue = RangeValues(30, 50);
  String? _gender;
  late TextEditingController _experinceController;

  List<clothe> _clothes = <clothe>[
    clothe(title: "T_shert"),
    clothe(title: "sweater"),
    clothe(title: "boots"),
  ];
  List<Country> _country = <Country>[
    Country(id: 1, title: "Gaza"),
    Country(id: 2, title: "Nables"),
    Country(id: 3, title: "Ramalla"),
  ];
  int? _select;
  List<String> _experince = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _experinceController = TextEditingController();
  }

  @override
  void dispose() {
    _experinceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: [
        Text("Notifcation"),
        SwitchListTile(
            title: Text("Notifcations"),
            subtitle: Text("Notifcations on/ off"),
            selectedTileColor: Colors.orange,
            activeColor: Colors.orange,
            inactiveTrackColor: Colors.grey,
            value: _check,
            onChanged: (bool value) {
              setState(() => _check = value);
            }),
        Text("price"),
        RangeSlider(
            min: 0,
            max: 200,
            divisions: 10,
            labels: RangeLabels(
                _rangevalue.start.toString(), _rangevalue.end.toString()),
            values: _rangevalue,
            onChanged: (RangeValues value) {
              setState(() => _rangevalue = value);
            }),
        Text("gender"),
        Row(children: [
          Expanded(
            child: RadioListTile<String>(
              onChanged: (String? value) {
                setState(() => _gender = value);
              },
              value: 'M',
              title: Text('meal'),
              groupValue: _gender,
              selectedTileColor: Colors.grey,
              activeColor: Colors.orange,
            ),
          ),
          Expanded(
            child: RadioListTile<String>(
              onChanged: (String? value) {
                setState(() => _gender = value);
              },
              value: 'f',
              title: Text('Femalmeal'),
              groupValue: _gender,
              selectedTileColor: Colors.grey,
              activeColor: Colors.orange,
            ),
          ),
        ]),
        Text("clothes"),
        for (clothe c in _clothes)
          CheckboxListTile(
            title: Text(c.title),
            onChanged: (bool? value) {
              if (value != null) {
                setState(() => c.checked = value);
              }
            },
            activeColor: Colors.orange,
            value: c.checked,
          ),
        Text("country"),
        DropdownButton<int>(
          value: _select,
          hint: Text('choes the once'),
          isExpanded: true,
          onChanged: (int? value) {
            setState(() => _select = value);
          },
          items: _country
              .map((Country) => DropdownMenuItem<int>(
                    child: Text(Country.title),
                    value: Country.id,
                  ))
              .toList(),
        ),
        TextField(
          keyboardType: TextInputType.text,
          controller: _experinceController,
          maxLines: 2,
          onSubmitted: (String v) {
            perform();
          },
          decoration: InputDecoration(
              hintText: "enter Experince",
              hintStyle: GoogleFonts.cairo(),
              prefixIcon: Icon(Icons.work_outline_outlined),
              suffixIcon: IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  perform();
                },
              ),
              counterText: ''),
        ),
        SizedBox(height: 20,),
        Wrap(
          spacing: 10,
            children: _experince
                .map((e) => Chip(
                      label: Text(e),
                      backgroundColor: Color(0xFFd3d3d3),
                      elevation: 5,
                      onDeleted:(){
                     setState(()=>deleate(e));},

                    ))
                .toList())
      ],
    );
  }

  void perform() {
    if (checked()) {
      save();
    }
  }

  bool checked() {
    if (_experinceController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("error")));
    return false;
  }

  void save() {
    setState(() {
      _experince.add(_experinceController.text);
      _experinceController.clear();
    });
  }
  void deleate(String value){
    _experince.remove(value);
  }

}
