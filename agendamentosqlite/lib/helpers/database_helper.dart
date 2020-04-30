import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../models/contado.dart';


class DatabaseHelper{

  static DatabaseHelper _databaseHelper;
  static Database _database;

  //usando para difinir as colunas da tabela
  String contatoTable = 'contato';
  String colId = 'id';
  String colNome = 'nome';
  String colEmail = 'contato';
  String colImagem = 'imagem';
  
  
  //construtor 
  DatabaseHelper._createInstance();

  factory DatabaseHelper(){
    
    if(_databaseHelper == null){
      //executado somente uma vez
      _databaseHelper = DatabaseHelper._createInstance();

    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

Future<Database> initializeDatabase() async{
  Directory directory = await getApplicationDocumentsDirectory();
  String path = directory.path + 'contatos.db';

  var contatosDatabase = await openDatabase(path,version:1,onCreate:_onCreateDb);
  return contatosDatabase;

}
void _onCreateDb(Database db, int newVersion) async{
  await db.execute("CREATE TABLE $contatoTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colNome TEXT,''$colEmail, $colImagem TEXT,)");
}

//Incluir um objeto contato do banco de dados

Future<int> insertContato(Contato contato) async{

  Database db = await this.database;
  
  var resultado = await db.insert(contatoTable, contato.toMap());
  
  return resultado;
} 
//inseri contato
Future<Contato> getContato(int id) async{

  Database db = await this.database;
  
  List<Map> maps = await db.query(
    contatoTable, 
    columns:[colId,colNome,colEmail,colImagem],
    where: "$colId = ?",
    whereArgs: [id]
  
   );
   if(maps.length > 0){
     return Contato.fromMap(maps.first);

   }else{
     return null;
   }
}

///lista de contatos

Future<List<Contato>> getContatos()async{

  Database db = await this.database;

  var resultado = await db.query(contatoTable);

  List<Contato> listadecontatos =
    resultado.isNotEmpty ? resultado.map(
    (c) => Contato.fromMap(c)).toList() : [];

  return listadecontatos;
}
///atualizar o objeti Contato e salva no banco de dados
Future<int> updateContato (Contato contato) async{
  var db = await this.database;

  var resultado = await db.update(
    contatoTable, contato.toMap(),
    where: '$colId = ?',
    whereArgs: [contato.id],
    );
    
  return resultado;

}

// deletar um o objeto do de contato bd
Future<int> deletaContato (int id) async{
  var db = await this.database;

  var resultado = await db.delete(
    contatoTable,
    where: '$colId = ?',
    whereArgs: [id],
    );
    
  return resultado;

}

//Obete o numero de resgistro na tabela

Future<int> getCount() async {

  Database db = await this.database;

  List<Map<String,dynamic>> x = await db.rawQuery('SELECT COUNT(*) from $contatoTable ');

  int resultado = Sqflite.firstIntValue(x);

  return resultado;
}
///fecha o banco
Future close() async{
  Database db = await this.database;

  db.close();
}



}