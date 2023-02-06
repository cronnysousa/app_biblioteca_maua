import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'livro_sede.dart';

class PaginaLivroSede extends StatelessWidget {
  final LivroSede livro;

  const PaginaLivroSede(this.livro, {Key? key}) : super(key: key);

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
                "https://bibliotecaetecmaua.azurewebsites.net/Content/Images/${livro.imagem}",
          ),
          ListTile(
            leading: const Text("Titulo:"),
            title: Text(livro.titulo),
          ),
          ListTile(
            leading: const Text("Autor:"),
            title: Text(livro.autorPrincipal),
          ),
          ListTile(
            leading: const Text("Assuntos:"),
            title: Text(livro.assuntos),
          ),
          ListTile(
            leading: const Text("Edicao:"),
            title: Text(livro.edicao),
          ),
          ListTile(
            leading: const Text("Ano:"),
            title: Text(livro.ano),
          ),
          ListTile(
            leading: const Text("Editora:"),
            title: Text(livro.editora),
          ),
          ListTile(
            leading: const Text("Autores:"),
            title: Text(livro.autores),
          ),
          ListTile(
            leading: const Text("ISBN ou ISSN:"),
            title: Text(livro.isbnIssn),
          ),
        ],
      ),
    );
  }
}
