import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoButtonPage extends StatefulWidget {
  const CupertinoButtonPage({super.key});

  @override
  State<CupertinoButtonPage> createState() => _CupertinoButtonPageState();
}

class _CupertinoButtonPageState extends State<CupertinoButtonPage> {
  Color? _buttonColor = CupertinoColors.activeBlue;
  String _buttonText = "Confirmar";

  final List<Color?> _colors = [
    CupertinoColors.activeBlue,
    CupertinoColors.activeGreen,
    CupertinoColors.destructiveRed,
    null, // padrão sem cor, botão transparente
  ];

  final List<String> _texts = [
    "Confirmar",
    "Salvar",
    "Excluir",
    "Cancelar",
  ];

  void _randomize() {
    setState(() {
      _buttonColor = (_colors..shuffle()).first;
      _buttonText = (_texts..shuffle()).first;
    });
  }

  void _showSnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Botão "$_buttonText" pressionado!'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: CupertinoButton')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Propriedades principais:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Text(
              'child (texto): $_buttonText',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'color: ${_buttonColor == null ? "Transparente (padrão)" : _buttonColor.toString()}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            Center(
              child: CupertinoButton(
                color: _buttonColor,
                child: Text(_buttonText),
                onPressed: () {
                  _showSnackBar(context);
                  _randomize();
                },
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Boas práticas:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Utilize cores que sigam o estilo iOS para manter consistência.\n'
                  '• Use textos claros e objetivos no botão.\n'
                  '• Forneça feedback visual imediato (ex: SnackBar) para confirmar a ação.\n'
                  '• Evite usar cor em botões secundários para não confundir o usuário.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
