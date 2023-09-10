import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? _database;
List WholeDataList = [];

class LocalDatabase {
  Future get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('Local.db');
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Localdata(id INTEGER PRIMARY KEY,
      Website VARCHAR NOT NULL,
      Email_username VARCHAR NOT NULL,
      Password VARCHAR NOT NULL)
    ''');
  }

  Future addDataToDatabase({website, emailusername, password}) async {
    final db = await database;
    if (![website == null && emailusername == null && password]
        .contains(null)) {
      await db.insert(
        "Localdata",
        {
          "Website": website,
          "Email_username": emailusername,
          "Password": password
        },
      );
      print('Website name : $website');
      print('Email/Username name : $emailusername');
      print('Password name : $password');
      return 'added';
    } else {
      print('****************************************');
      return 'Empty';
    }
  }

  Future readAllData() async {
    final db = await database;
    final alldata = await db!.query('Localdata');
    WholeDataList = alldata;
    return WholeDataList;
  }

  Future updateData({website, emailusername, password, id}) async {
    try {
      final db = await database;
      final dbupdatedId = await db.rawUpdate(
          'UPDATE Localdata SET Website=?, Email_username=?, Password=? WHERE id=?',
          [website, emailusername, password, id]);
      return dbupdatedId;
    } on Exception catch (e) {
      // Anything else that is an exception
      print('Unknown exception at updateData function of database: $e');
    } catch (e) {
      // No specified type, handles all
      print('Something really unknown at updateData function of database: $e');
    }
  }

  Future readSingleData({id}) async {
    var datalist = [];
    final db = await database;
    print('-*-*-*--*-************** ${id}');
    //await db!.delete('Localdata', where: 'id=?', whereArgs: [id]);
    List<Map> readval =
        await db.rawQuery('SELECT * FROM Localdata WHERE id=?', [id]);
    var listdata = readval.toList();
    print('/////////////////////--- Read data-----------');
    print(listdata[0]['Website']);
    datalist.add(listdata[0]['id']);
    datalist.add(listdata[0]['Website']);
    datalist.add(listdata[0]['Email_username']);
    datalist.add(listdata[0]['Password']);
    return datalist;
  }

  Future deleteData({id}) async {
    final db = await database;
    await db!.delete('Localdata', where: 'id=?', whereArgs: [id]);
    print('Deleted successfully ${id}');
    return 'Deleted';
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("Please fill in all the inputs."),
      ),
    );
  }
}
