// main.dart
import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: PaginaAgenda());
  }
}

class PaginaAgenda extends StatefulWidget {
  @override
  State<PaginaAgenda> createState() => _PaginaAgendaState();
}

class _PaginaAgendaState extends State<PaginaAgenda> {
  //variavel do tipo final
  final List<Map<String, String>> _atividades = [];

  //método adicionar atividade - metodo tem parametros
  void _adicionarAtividades(
      String tipo, String descricao, String data, String imagem) {
    setState(() {
      _atividades.add({
        'tipo': tipo,
        'descricao': descricao,
        'data': data,
        'imagem': imagem
      });
    });
    //
  }

  //correção do parametro imagem
  void _editarAtividade(
      int index, String tipo, String descricao, String data, String imagem) {
    setState(() {
      _atividades[index] = {
        'tipo': tipo,
        'descricao': descricao,
        'data': data,
        'imagem': imagem
      };
    });
  }

  //MÉTODO EXCLUIR ATIVIDADE
  void _excluirAtividade(int index) {
    setState(() {
      _atividades.remove(index);
    });
  }

//MODAL PARA CONFIRMAÇÃO DE EXCLUSÃO
  void _confirmarExclusao(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirmar'),
            content: Text('Tem certeza que deseja excluir esta atividade?'),
            actions: [
              TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  //MÉTODO CADASTRAR MODAL
  //Método do Botão
  void modalCadastrar(BuildContext context) {
    final TextEditingController tipoController = TextEditingController();
    final TextEditingController descricaoController = TextEditingController();
    final TextEditingController dataController = TextEditingController();
    final TextEditingController imagemController = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cadastrar Atividade",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.close))
                        ],
                      ),
                      //ADICIONAR O FORMULARIO
                      TextField(
                        controller: tipoController,
                        decoration: InputDecoration(
                          labelText: 'Tipo de Atividade',
                        ),
                      ),
                      TextField(
                        controller: descricaoController,
                        decoration: InputDecoration(
                          labelText: 'Descrição',
                        ),
                      ),
                      TextField(
                        controller: dataController,
                        decoration: InputDecoration(
                          labelText: 'Data',
                        ),
                      ),
                      TextField(
                        controller: imagemController,
                        decoration: InputDecoration(
                          labelText: 'URL da Imagem',
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            _adicionarAtividades(
                                tipoController.text,
                                descricaoController.text,
                                dataController.text,
                                imagemController.text);
                            Navigator.of(context).pop();
                          },
                          child: Text('Cadastrar'))
                    ],
                  ),
                ),
              ));
        });
  }

  //CRIANDO MODAL EDITAR
  //tipo parametro inteiro
  void modalEditar(BuildContext context, int index) {
    final TextEditingController tipoController =
        TextEditingController(text: _atividades[index]['tipo']);
    final TextEditingController descricaoController =
        TextEditingController(text: _atividades[index]['descricao']);
    final TextEditingController dataController =
        TextEditingController(text: _atividades[index]['data']);
    final TextEditingController imagemController =
        TextEditingController(text: _atividades[index]['imagem']);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cadastrar Atividade",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.close))
                        ],
                      ),
                      //ADICIONAR O FORMULARIO
                      TextField(
                        controller: tipoController,
                        decoration: InputDecoration(
                          labelText: 'Tipo de Atividade',
                        ),
                      ),
                      TextField(
                        controller: descricaoController,
                        decoration: InputDecoration(
                          labelText: 'Descrição',
                        ),
                      ),
                      TextField(
                        controller: dataController,
                        decoration: InputDecoration(
                          labelText: 'Data',
                        ),
                      ),
                      TextField(
                        controller: imagemController,
                        decoration: InputDecoration(
                          labelText: 'URL da Imagem',
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            _editarAtividade(
                                index,
                                tipoController.text,
                                descricaoController.text,
                                dataController.text,
                                imagemController.text);
                            Navigator.of(context).pop();
                          },
                          child: Text('Atualizar'))
                    ],
                  ),
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Agenda - Barrado',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 134, 3, 10),
      ),
      backgroundColor: Color.fromARGB(255, 243, 239, 240),
      body: ListView.builder(
        itemCount: _atividades.length,
        itemBuilder: (context, index) {
          return Atividade(
            _atividades[index]['tipo']!,
            _atividades[index]['imagem']!,
            () => modalEditar(context, index),
            () => _confirmarExclusao(context, index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modalCadastrar(context);
          print('botão pressionado');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Atividade extends StatelessWidget {
  final String nome; //variavel nome Atividade
  final String imagem_Atv;
  final VoidCallback onEdit;
  //CRIANDO VARIAVEL PARA EXCLUIR ATIVIDADE
  final VoidCallback onDelete;

  const Atividade(this.nome, this.imagem_Atv, this.onEdit, this.onDelete,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.amber,
              height: 140,
            ),
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: const Color.fromARGB(255, 85, 88, 88),
                    width: 100,
                    height: 100,
                    child: Image.network(imagem_Atv, //variavel
                        fit: BoxFit.cover),
                  ),
                  Text(nome),
                  ElevatedButton(
                    onPressed: onEdit,
                    child: Icon(Icons.edit, color: Colors.green),
                  ),
                  ElevatedButton(
                      onPressed: onDelete,
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
