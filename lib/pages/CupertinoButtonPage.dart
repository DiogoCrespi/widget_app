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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Propriedades principais',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _infoRow('child (texto):', _buttonText),
            const SizedBox(height: 8),
            _infoRow('color:', _buttonColor == null ? 'Transparente (padrão)' : _colorToName(_buttonColor!)),
            const SizedBox(height: 40),
            Center(
              child: CupertinoButton(
                color: _buttonColor,
                child: Text(
                  _buttonText,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  _showSnackBar(context);
                  _randomize();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            value,
            style: TextStyle(fontSize: 17, color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }

  static String _colorToName(Color color) {
    if (color == CupertinoColors.activeBlue) return 'Active Blue';
    if (color == CupertinoColors.activeGreen) return 'Active Green';
    if (color == CupertinoColors.destructiveRed) return 'Destructive Red';
    return color.toString();
  }
}
