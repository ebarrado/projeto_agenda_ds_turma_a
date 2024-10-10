// main.dart
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

class PaginaAgenda extends StatelessWidget {
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
      body: ListView(
        //scrollDirection: Axis.horizontal,
        children: [
          Atividade('Atividade 1',
              'https://storage.googleapis.com/cms-storage-bucket/780e0e64d323aad2cdd5.png'),
          Atividade('Atividade 2',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQexxwaG6qMQt_I6TW_ezMQu3suyMWQPKmNgQ&s'),
          Atividade('Atividade 3',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn7XprTV9T6eic0nFpkS4RziT8pOa2nbJ2jw&s'),
          Atividade('Atividade 4',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_uLYwsfqtf-Ax5N48y1w3J7IA07XxU-eGVA&s')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // modalCadastrar(context);
          showAboutDialog(context: context);
          print('botão pressionado');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CadastrarAtividade extends StatefulWidget {
  const CadastrarAtividade({super.key});

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
                      )
                    ],
                  ),
                ),
              ));
        });
  }

  @override
  State<CadastrarAtividade> createState() => _CadastrarAtividadeStatus();
}

class _CadastrarAtividadeStatus extends State<CadastrarAtividade> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Atividade extends StatelessWidget {
  final String nome; //variavel nome Atividade
  final String imagem_Atv;

  const Atividade(this.nome, this.imagem_Atv, {Key? key}) : super(key: key);

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
                    onPressed: () {},
                    child: Icon(Icons.edit),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
