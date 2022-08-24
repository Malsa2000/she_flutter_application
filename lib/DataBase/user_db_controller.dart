import 'package:she_flutter_application/model/prosess_responding.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';
import 'data_base_controller.dart';

class UserDataBaseController {
  
  final Database _dataBase = DataBaseController().dataBase;

  Future<ProcessResponding> regester({required User user}) async {
    if (await _isUniqueEmail(email: user.email)) {
      int newRow = await _dataBase.rawInsert(
          'INSERT INTO users(name ,email ,password) VALUES (?,?,?)',
          [user.name, user.email, user.password]);
      return ProcessResponding(
          massage: newRow != 0 ? "Regester sucsess" : "Regester failed",
          sucess: newRow != 0);
    } else {
     return ProcessResponding(
          massage: "the email uesing ,choes another", sucess: false);
    }

  }

  Future<bool> _isUniqueEmail({required email}) async {
    List<Map<String, dynamic>> rowMap =
        await _dataBase.rawQuery('sELECT * FROM users WHERE email =?', [email]);

    return rowMap.isEmpty;
  }

  login({required String email, required String passwprd}) async {
    List<Map<String, dynamic>> rowMap = await _dataBase.query(User.tableName,
        where: 'email =? AND password =?', whereArgs: [email, passwprd]);
    if (rowMap.isNotEmpty) {
      User user = User.fromMap(rowMap.first);
    }
  }
}
