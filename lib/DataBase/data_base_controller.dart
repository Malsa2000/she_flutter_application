
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseController{

  late Database _dataBase;
  static DataBaseController? _instance;

  // nameed constractor;
  DataBaseController._();
  Database get dataBase => _dataBase;


  factory DataBaseController(){
    return _instance ??= DataBaseController._();
  }
 Future<void> initDataBase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path ,'app_db.sql');
    _dataBase =await openDatabase(path ,version: 1 ,
    onOpen: (Database db){},
    onCreate: (Database db ,int vertion )async{
      await db.execute(
          'CREATE TABLE USERS ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT ,'
          'name TEXT NOT NULL ,'
          'email TEXT NOT NULL ,'
          'password TEXT NOT NULL'
        ')');},
      onUpgrade: (Database db ,int oldvertion ,int newVertion ){},
      onDowngrade:(Database db ,int oldvertion ,int newVertion ){},











    );

  }
}