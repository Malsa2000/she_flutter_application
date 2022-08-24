import 'package:flutter/material.dart';
import 'package:she_flutter_application/pref/shared_pref_controller.dart';

class LangugesProvider extends ChangeNotifier{

  String languges =SharedPreferanceController().
  getValueForKey<String>(prefKey.languges.name) ?? 'en';

  void changLanguges(){
    languges =languges =='er' ?'ar' : 'en';
    SharedPreferanceController().changLanguges(langCode: languges);
    notifyListeners();
  }

}