import 'dart:convert';
import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'livro_ext.g.dart';

@JsonSerializable()
class LivroExt {
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

  LivroExt(
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

  Map<String, dynamic> toJson() => _$livro_extToJson(this);

  factory LivroExt.fromJson(Map<String, dynamic> json) => _$livro_extFromJson(json);

  static List<LivroExt> lista_livros_ext_fromJson(String str) {
    List<Map<String,dynamic>> _list =List<Map<String,dynamic>>.from(json.decode(str));
    List<LivroExt> _lisLivro=List.empty(growable: true);
    for(Map<String,dynamic> l in _list)
    {
      _lisLivro.add( LivroExt.fromJson(l) );
    }
    return _lisLivro;


  }
  static String lista_livros_ext_toJson (List<LivroExt> list) =>json.encode(List<dynamic>.from(list));

}