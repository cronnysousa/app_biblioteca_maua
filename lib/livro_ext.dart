class LivroExt {
  late String id;
  late String titulo;
  late String autor;
  late String editora;
  late int ano;
  late String edicao;
  late String isbn;
  late String resumo;
  late String situacao;

  LivroExt(
      {this.id='',
        this.titulo='',
        this.autor='',
        this.editora='',
        this.ano=0,
        this.edicao='',
        this.isbn='',
        this.resumo='',
        this.situacao=''});

  LivroExt.fromJson(Map<String, dynamic> json) {
    id = json['id']??'';
    titulo = json['titulo']??'';
    autor = json['autor']??'';
    editora = json['editora']??'';
    ano = json['ano']??0;
    edicao = json['edicao']??'';
    isbn = json['isbn']??'';
    resumo = json['resumo']??'';
    situacao = json['situacao']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['autor'] = this.autor;
    data['editora'] = this.editora;
    data['ano'] = this.ano;
    data['edicao'] = this.edicao;
    data['isbn'] = this.isbn;
    data['resumo'] = this.resumo;
    data['situacao'] = this.situacao;
    return data;
  }
}