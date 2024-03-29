import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import 'package:vcourse/cousemodule/courseCart/cart_model.dart';
/*
  Future<Database?> get db async {
    if(_db != null){
      return _db!;
    }

    _db = await initDatabase();
  }
 */

class DBHelper {

  static Database? _db ;

  Future<Database?> get db async {
    if(_db != null){
      return _db!;
    }

    _db = await initDatabase();
  }

  initDatabase()async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory() ;
    String path = join(documentDirectory.path , 'cart.db');
    var db = await openDatabase(path , version: 1 , onCreate: _onCreate,);
    return db ;
  }

  _onCreate (Database db , int version )async{
    await db
        .execute('CREATE TABLE cart (courseId INTEGER PRIMARY KEY ,courseName TEXT,coursePrice TEXT, courseInstructor TEXT , courseImage TEXT )');
  }

  Future<Cart> insert(Cart cart)async{
    //print(cart.toMap());
    var dbClient = await db ;

    if(dbClient == null)
    {
        dbClient = await db;
    }

    await dbClient!.insert('cart', cart.toMap());
    return cart;
  }

  Future<List<Cart>> getCartList()async{
    var dbClient = await db ;
    final List<Map<String , Object?>> queryResult =  await dbClient!.query('cart');
    return queryResult.map((e) => Cart.fromMap(e)).toList();

  }

  Future<int> delete(int courseId)async{
    var dbClient = await db ;
    return await dbClient!.delete(
        'cart',
        where: 'courseId = ?',
        whereArgs: [courseId]
    );
  }

  Future<int> updateQuantity(Cart cart)async{
    var dbClient = await db ;
    return await dbClient!.update(
        'cart',
        cart.toMap(),
        where: 'courseId = ?',
        whereArgs: [cart.courseId]
    );
  }
}