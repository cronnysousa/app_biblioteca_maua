import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'livro_ext.dart';


class PaginaLivroExtensao extends StatelessWidget {
  final LivroExt livro;

  const PaginaLivroExtensao(this.livro, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(livro.titulo),
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
            fit: BoxFit.scaleDown ,
            height: 200,
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl:
            "https://bibliotecaetecmaua.azurewebsites.net/Content/Images/Livro.jpg",
          ),
          ListTile(
            leading: const Text("Titulo:"),
            title: Text(livro.titulo),
          ),
          ListTile(
            leading: const Text("Autor:"),
            title: Text(livro.autor),
          ),
          ListTile(
            leading: const Text("Assuntos:"),
            title: Text(livro.resumo),
          ),
          ListTile(
            leading: const Text("Edicao:"),
            title: Text(livro.edicao),
          ),
          ListTile(
            leading: const Text("Ano:"),
            title: Text(livro.ano.toString()),
          ),
          ListTile(
            leading: const Text("Editora:"),
            title: Text(livro.editora),
          ),

          ListTile(
            leading: const Text("ISBN ou ISSN:"),
            title: Text(livro.isbn),
          ),
        ],
      ),
    );
  }
}
