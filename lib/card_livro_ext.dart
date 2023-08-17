import 'package:app_biblioteca_maua2/livro_ext.dart';
import 'package:app_biblioteca_maua2/pagina_livro_extensao.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';



class card_livro_ext extends StatelessWidget {
  final LivroExt livro;
  const card_livro_ext(this.livro, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.cyan,
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
            imageUrl: "https://bibliotecaetecmaua.azurewebsites.net/Content/Images/livro.jpg" ,
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
                      livro.autor,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      livro.resumo,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      livro.editora,
                      style: const TextStyle(
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

Route _createRoute(LivroExt livro) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PaginaLivroExtensao(livro),
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