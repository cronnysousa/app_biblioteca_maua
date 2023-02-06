// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livro_sede.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivroSede _$livro_sedeFromJson(Map<String, dynamic> json) => LivroSede(
      json['id'] as int,
      json['titulo'] as String,
      assuntos: json['assuntos'] as String? ?? '',
      autores: json['autores'] as String? ?? '',
      obra: json['obra'] as String? ?? '',
      idioma: json['idioma'] as String? ?? '',
      ano: json['ano'] as String? ?? '',
      material: json['material'] as String? ?? '',
      autorPrincipal: json['autorPrincipal'] as String? ?? '',
      isbnIssn: json['isbnIssn'] as String? ?? '',
      imagem: json['imagem'] as String? ?? '',
      edicao: json['edicao'] as String? ?? '',
      editora: json['editora'] as String? ?? '',
    );

Map<String, dynamic> _$livro_sedeToJson(LivroSede instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'assuntos': instance.assuntos,
      'autores': instance.autores,
      'obra': instance.obra,
      'idioma': instance.idioma,
      'ano': instance.ano,
      'material': instance.material,
      'autorPrincipal': instance.autorPrincipal,
      'imagem': instance.imagem,
      'edicao': instance.edicao,
      'editora': instance.editora,
      'isbnIssn': instance.isbnIssn,
    };
