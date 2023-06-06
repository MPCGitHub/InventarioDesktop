import 'package:flutter/material.dart';

class CadastroMonitor extends StatefulWidget {
  const CadastroMonitor({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CadastroMonitorState createState() => _CadastroMonitorState();
}

class _CadastroMonitorState extends State<CadastroMonitor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        title: const Text("Cadastro Monitor"),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Container(
            height: 35,
            color: Colors.grey.shade700.withOpacity(0.7),
            child: const Row(
              children: [],
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: MediaQuery.of(context).size.height * 0.91,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ImagemEstoque.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
