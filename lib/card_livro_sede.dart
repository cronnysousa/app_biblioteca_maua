import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'pagina_livro_sede.dart';
import 'livro_sede.dart';

class card_livro_sede extends StatelessWidget {
  final LivroSede livro;
  const card_livro_sede(this.livro, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.limeAccent,
        elevation: 5,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        child:ListTile(
          onTap: (){
            Navigator.push(context, _createRoute(livro));
          },
          leading: CachedNetworkImage(
            placeholder: (context, url) =>
            const CircularProgressIndicator(),
            imageUrl: "https://bibliotecaetecmaua.azurewebsites.net/Content/Images/${livro.imagem}" ,
            width: 50,
          ),
          title:
          Column(
                  children: [
                    Text(
                      livro.titulo,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      livro.autorPrincipal,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      livro.assuntos,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      livro.editora,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
        );
  }
}

Route _createRoute(LivroSede livro) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PaginaLivroSede(livro),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}