import 'package:shared_preferences/shared_preferences.dart';
enum prefKey{languges ,login}

class SharedPreferanceController{
 //singelton class .......
  SharedPreferanceController._();

  late SharedPreferences _sharedPreferance;
  static SharedPreferanceController? _instance;


 factory SharedPreferanceController() {
   return _instance ??= SharedPreferanceController._();
 }

  Future<void> initSharedPref() async {
      _sharedPreferance = await  SharedPreferences.getInstance();
 }


 void save({required String email}){
   _sharedPreferance.setString(prefKey.login.name, email);
 }

 Future<bool> changLanguges({required String langCode})async{
  return await _sharedPreferance.setString(prefKey.languges.name , langCode);
 }

 String get languges => _sharedPreferance.getString(prefKey.languges.name) ?? 'en';

T? getValueForKey<T>(String key){
  if(_sharedPreferance.containsKey(key)){
    return _sharedPreferance.get(key) as T;
  }
  return null;
}

Future<bool> removeValueFrom({required String key})async{
if(_sharedPreferance.containsKey(key)){
  return _sharedPreferance.remove(key);
}
return false;
}

void clear(){}
}