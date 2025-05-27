import 'package:flutter/material.dart';

class SemanticsDemoPage extends StatefulWidget {
  const SemanticsDemoPage({super.key});

  @override
  State<SemanticsDemoPage> createState() => _SemanticsDemoPageState();
}

class _SemanticsDemoPageState extends State<SemanticsDemoPage> {
  bool _buttonEnabled = true;
  int _clickCount = 0;

  void _toggleButton() {
    setState(() {
      _buttonEnabled = !_buttonEnabled;
      _clickCount = 0;
    });
  }

  void _increment() {
    if (_buttonEnabled) {
      setState(() {
        _clickCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Semantics')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Widget Semantics: oferece informações acessíveis para tecnologias assistivas.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            const Text(
              'Exemplo prático: botão com e sem Semantics.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),

            // Botão sem Semantics
            ElevatedButton(
              onPressed: _increment,
              child: Text('Cliquei $_clickCount vezes'),
            ),
            const SizedBox(height: 12),

            // Botão com Semantics
            Semantics(
              label: 'Botão contador',
              hint: _buttonEnabled
                  ? 'Clique para incrementar o contador'
                  : 'Botão desativado',
              value: 'Contador atual: $_clickCount',
              enabled: _buttonEnabled,
              button: true,
              child: ElevatedButton(
                onPressed: _buttonEnabled ? _increment : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _buttonEnabled ? null : Colors.grey,
                ),
                child: Text(
                  _buttonEnabled
                      ? 'Cliquei $_clickCount vezes (acessível)'
                      : 'Desativado (acessível)',
                ),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: _toggleButton,
              icon: const Icon(Icons.toggle_on),
              label: Text(_buttonEnabled ? 'Desativar botão' : 'Ativar botão'),
            ),

            const SizedBox(height: 30),
            const Text(
              'Boas práticas para Semantics:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Sempre forneça labels claras e descritivas para elementos interativos.\n'
                  '• Use hint para dar dicas adicionais de uso.\n'
                  '• Atualize o value para refletir o estado atual (ex: contadores).\n'
                  '• Defina enabled corretamente para indicar se o controle está ativo.\n'
                  '• Combine com outros widgets para melhorar a experiência para todos.\n'
                  '• Teste com leitores de tela para garantir a usabilidade.\n',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
