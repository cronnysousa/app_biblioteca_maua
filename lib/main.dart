import 'package:flutter/material.dart';

import 'card_livro_sede.dart';
import 'data/json_conector_livros.dart';
import 'livro_sede.dart';

void main() {
  runApp(const BibliotecaApp());
}

class BibliotecaApp extends StatelessWidget {
  const BibliotecaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaginaInicial(title: 'Flutter Demo Home Page'),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  TextEditingController _txtPesquisa = TextEditingController();
  int conteudo = 0;
  String pesquisa = '';
  Widget corpo = Text("");
  bool loaded = false;
  List<LivroSede>? lista;
  String p='';


  void getData() async {
    lista = await JsonConectorLivros.getLivrosSede();
    if (lista != null) {
      setState(() {
        loaded = true;
      });
    }
  }

  void getDataPesquisa(String p) async {
    lista = await JsonConectorLivros.getLivrosSedePesquisa(p);
    if (lista != null) {
      setState(() {
        loaded = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Menu",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
            ListTile(
              leading:
                  Icon(Icons.search_rounded, size: 20, color: Colors.brown),
              title: TextField(
                controller: _txtPesquisa,
              ),

            ),
            ListTile(
              leading: Icon(Icons.menu_book, size: 50, color: Colors.brown),
              title: Text("Biblioteca - Maua"),
              onTap: () {


                setState(() {
                  loaded=false;
                  conteudo = 1;
                  pesquisa = _txtPesquisa.value.text;
                  if(pesquisa!='') {
                    getDataPesquisa(pesquisa);
                  }
                  else {
                    getData();
                  }

                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book, size: 50, color: Colors.brown),
              title: Text("Biblioteca - João Paulo"),
            )
          ],
        ),
      ),
      body: Visibility(
        visible: conteudo == 1 ? true : false,
        child:
        Center(
          child: Visibility(
            replacement: CircularProgressIndicator(),
            visible: loaded,
            child: ListView.builder(

              itemCount: lista?.length,
              itemBuilder: (context, index) {
                return card_livro_sede(lista!.elementAt(index));
              }

              ,
            ),
          ),
        )
        ,
        replacement: Text(""),
      ),


    );
  }
}













