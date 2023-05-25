import 'dart:io';

import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

// tables
  static const users = 'Users';
  static const bookings = 'Bookings';

// table1
  static const uid = 'UserId';
  static const email = 'Email';
  static const password = 'Password';

// table2
  static const busname = 'Busname';
  static const age = 'Age';
  static const name = 'Name';
  static const gender = 'Gender';
  static const status = 'Status';
  static const date = 'Date';
  static const seatno = 'Seatno';
  static const id = 'Id';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _db;

  Future<Database?> get database async {
    _db ??= await _init();
    return _db;
  }

  // this opens the database (and creates it if it doesn't exist)
  _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
                        CREATE TABLE $users(
                          $uid INTEGER NOT NULL PRIMARY KEY,
                          $email TEXT NOT NULL,
                          $password TEXT NOT NULL
                          )
                     ''');
    await db.execute('''
                        CREATE TABLE $bookings(
                          $busname TEXT NOT NULL,
                          $name TEXT NOT NULL,
                          $age INTEGER NOT NULL,
                          $gender TEXT NOT NULL,
                          $seatno INTEGER NOT NULL,
                          $status BOOLEAN NOT NULL,
                          $date TEXT NOT NULL,
                          $id INTEGER NOT NULL
                        )
                     ''');
  }

  Future<int> insert(Map<String, dynamic> row, String table) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  Future<int> delete(int ticketid, String ticketdate, String ticketName) async {
    Database? db = await instance.database;
    return await db!.delete(bookings,
        where: '$id=? AND $date=? AND $name=?',
        whereArgs: [ticketid, ticketdate, ticketName]);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  Future<List<Map<String, dynamic>>> queryTickets(int userid) async {
    Database? db = await instance.database;
    return await db!.rawQuery('''SELECT *
           FROM $bookings
           WHERE $id=?;
        ''', [userid]);
  }

  Future<List<Map<String, dynamic>>> querySeats(
      int seatNo, String busName, String dates) async {
    Database? db = await instance.database;
    return await db!.rawQuery('''
                                 SELECT $status
                                 FROM $bookings
                                 WHERE $seatno=? AND EXISTS
                                 (SELECT $seatno FROM $bookings WHERE $status=? AND $seatno=? AND $busname=? AND $date=?);
                              ''', [seatNo, true, seatNo, busName, dates]);
  }

  Future<List<Map<String, dynamic>>> queryEmail(String emailid) async {
    Database? db = await instance.database;
    return await db!.rawQuery('''SELECT * 
    FROM $users
    WHERE $email=?''', [emailid]);
  }
}
