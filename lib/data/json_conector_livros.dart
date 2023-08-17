
import 'dart:convert';

import 'package:app_biblioteca_maua2/livro_ext.dart';
import 'package:http/http.dart' as http;

import '../livro_sede.dart';

class JsonConectorLivros{
  static Future<List<LivroSede>?> getLivrosSede() async
  {

      Map<String,String> userHeader = {"Content-type": "application/json", "Accept": "application/json"};
      var cliente= http.Client();
      var uri =Uri.parse( 'https://bibliotecaetecmaua.azurewebsites.net//api/LivrosSedeApi');
      var response  =await cliente.get(uri,headers: userHeader);
      if(response.statusCode==200)
      {
        var json = response.body;
        return LivroSede.lista_livros_sede_fromJson(json);
      }
      else{
        return null;
      }


  }

  static Future<List<LivroSede>?> getLivrosSedePesquisa(String p) async
  {

    Map<String,String> userHeader = {"Content-type": "application/json", "Accept": "application/json"};
    var cliente= http.Client();
    var uri =Uri.parse( 'https://bibliotecaetecmaua.azurewebsites.net/api/LivrosSedeApi/?pesquisa='+p);
    var response  =await cliente.get(uri,headers: userHeader);
    if(response.statusCode==200)
    {
      var json = response.body;
      return LivroSede.lista_livros_sede_fromJson(json);
    }
    else{
      return null;
    }


  }


  static Future<List<LivroExt>?> getLivrosExt() async
  {

    Map<String,String> userHeader = {"Content-type": "application/json", "Accept": "application/json"};
    var cliente= http.Client();
    var uri =Uri.parse( 'https://bibliotecaetecmaua.azurewebsites.net//api/LivroExtApi');
    var response  =await cliente.get(uri,headers: userHeader);
    if(response.statusCode==200)
    {
      var json = response.body;
      List<dynamic> lista =  jsonDecode(json);
      return  lista.map((e) => LivroExt.fromJson(e)).toList() ;
    }
    else{
      return null;
    }


  }
}