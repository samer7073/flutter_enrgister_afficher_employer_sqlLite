import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model_employer.dart';

class DataBaseHelper {
  DataBaseHelper._privateConstructor();

  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  DataBaseHelper();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'Employee123.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      //onUpgrade:_onupgrade,
      //onDowngrade:
    );
  }

  Future _onCreate(Database db, int version) async {
    print("Creatin database...........");
    await db.execute('''
      CREATE TABLE Employe(
      matricule TEXT NOT NULL ,
      nom TEXT NOT NULL ,
      prenom TEXT NOT NULL ,
      age INTEGER 
       );
      ''');
    print("Fin Creatin database...........");
  }

  Future<int> add(Employe emp) async {
    Database db = await instance.database;
    return await db.insert('Employe', emp.toMap());
  }

  Future<List> getEmployees() async {
    Database db = await instance.database;
    return await db.rawQuery('select * from Employe');
  }
}
