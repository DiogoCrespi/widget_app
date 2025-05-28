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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Semantics')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Widget Semantics',
              style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Oferece suporte de acessibilidade a tecnologias assistivas, como leitores de tela.',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),

            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exemplo prático',
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Compare um botão comum com um botão acessível utilizando o widget Semantics.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),

                    // Botão comum
                    ElevatedButton.icon(
                      onPressed: _increment,
                      icon: const Icon(Icons.touch_app),
                      label: Text('Cliquei $_clickCount vezes'),
                    ),
                    const SizedBox(height: 16),

                    // Botão com Semantics
                    Semantics(
                      container: true,
                      label: 'Botão contador. Contador atual: $_clickCount',
                      hint: _buttonEnabled
                          ? 'Clique para incrementar o contador'
                          : 'Botão desativado',
                      value: '$_clickCount',
                      enabled: _buttonEnabled,
                      button: true,
                      excludeSemantics: true,
                      child: ElevatedButton.icon(
                        onPressed: _buttonEnabled ? _increment : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _buttonEnabled ? null : Colors.grey.shade400,
                        ),
                        icon: const Icon(Icons.accessibility),
                        label: Text(
                          _buttonEnabled
                              ? 'Cliquei $_clickCount vezes (acessível)'
                              : 'Desativado (acessível)',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Center(
                      child: ElevatedButton.icon(
                        onPressed: _toggleButton,
                        icon: Icon(
                          _buttonEnabled ? Icons.toggle_on : Icons.toggle_off,
                          color: _buttonEnabled ? Colors.green : Colors.red,
                        ),
                        label: Text(_buttonEnabled ? 'Desativar botão' : 'Ativar botão'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
