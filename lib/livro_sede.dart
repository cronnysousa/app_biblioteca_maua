import 'dart:convert';
import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'livro_sede.g.dart';

@JsonSerializable()
class LivroSede {
  int id;
  String titulo;
  String assuntos;
  String autores;
  String obra;
  String idioma;
  String ano;
  String material;
  String autorPrincipal;
  String imagem;
  String edicao;
  String editora;
  String isbnIssn;

  LivroSede(
      this.id,
      this.titulo,
      {
      this.assuntos ='',
      this.autores='',
      this.obra='',
      this.idioma='',
      this.ano='',
      this.material='',
      this.autorPrincipal='',
      this.isbnIssn = '',
      this.imagem='',
      this.edicao='',
      this.editora=''});

      Map<String, dynamic> toJson() => _$livro_sedeToJson(this);

  factory LivroSede.fromJson(Map<String, dynamic> json) => _$livro_sedeFromJson(json);

  static List<LivroSede> lista_livros_sede_fromJson(String str) {
     List<Map<String,dynamic>> _list =List<Map<String,dynamic>>.from(json.decode(str));
     List<LivroSede> _lisLivro=List.empty(growable: true);
     for(Map<String,dynamic> l in _list)
    {
      _lisLivro.add( LivroSede.fromJson(l) );
    }
    return _lisLivro;


  }
  static String lista_livros_sede_toJson (List<LivroSede> list) =>json.encode(List<dynamic>.from(list));

}
