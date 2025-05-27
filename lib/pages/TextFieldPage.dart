import 'package:flutter/material.dart';

class TextFieldWidgetPage extends StatefulWidget {
  const TextFieldWidgetPage({super.key});

  @override
  State<TextFieldWidgetPage> createState() => _TextFieldWidgetPageState();
}

class _TextFieldWidgetPageState extends State<TextFieldWidgetPage> {
  final TextEditingController _controller = TextEditingController();

  TextInputType _keyboardType = TextInputType.text;
  bool _obscureText = false;
  int? _maxLength;
  InputDecoration _decoration = const InputDecoration(
    labelText: 'Digite algo',
    border: OutlineInputBorder(),
  );

  String _inputValue = '';

  // Opções para decoration
  final List<InputDecoration> _decorationOptions = [
    const InputDecoration(
      labelText: 'Padrão',
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.search),
    ),
    const InputDecoration(
      labelText: 'Com dica',
      hintText: 'Digite para buscar',
      border: OutlineInputBorder(),
      suffixIcon: Icon(Icons.clear),
    ),
    const InputDecoration(
      labelText: 'Com erro',
      errorText: 'Campo obrigatório',
      border: OutlineInputBorder(),
    ),
    const InputDecoration(
      labelText: 'Simples',
      border: UnderlineInputBorder(),
    ),
  ];

  // Nomes para mostrar na UI para decoration
  final List<String> _decorationLabels = [
    'Padrão',
    'Com dica',
    'Com erro',
    'Simples',
  ];

  int _decorationSelectedIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDecorationChanged(int? index) {
    if (index == null) return;
    setState(() {
      _decorationSelectedIndex = index;
      _decoration = _decorationOptions[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: TextField Widget')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Propriedades principais do TextField:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Dropdown para keyboardType
            DropdownButton<TextInputType>(
              value: _keyboardType,
              isExpanded: true,
              onChanged: (value) {
                if (value != null) {
                  setState(() => _keyboardType = value);
                }
              },
              items: [
                DropdownMenuItem(
                  value: TextInputType.text,
                  child: Text('keyboardType: text'),
                ),
                DropdownMenuItem(
                  value: TextInputType.number,
                  child: Text('keyboardType: number'),
                ),
                DropdownMenuItem(
                  value: TextInputType.emailAddress,
                  child: Text('keyboardType: emailAddress'),
                ),
                DropdownMenuItem(
                  value: TextInputType.phone,
                  child: Text('keyboardType: phone'),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Dropdown para decoration
            DropdownButton<int>(
              value: _decorationSelectedIndex,
              isExpanded: true,
              onChanged: _onDecorationChanged,
              items: List.generate(_decorationLabels.length, (index) {
                return DropdownMenuItem(
                  value: index,
                  child: Text('decoration: ${_decorationLabels[index]}'),
                );
              }),
            ),
            const SizedBox(height: 8),

            // Switch para obscureText
            Row(
              children: [
                const Text('obscureText (senha)'),
                Switch(
                  value: _obscureText,
                  onChanged: (v) => setState(() => _obscureText = v),
                ),
              ],
            ),

            // Dropdown para maxLength
            DropdownButton<int?>(
              value: _maxLength,
              isExpanded: true,
              hint: const Text('maxLength: nenhum'),
              onChanged: (value) => setState(() => _maxLength = value),
              items: <int?>[null, 5, 10, 20]
                  .map((e) => DropdownMenuItem<int?>(
                value: e,
                child: Text(e == null ? 'Nenhum' : 'maxLength: $e'),
              ))
                  .toList(),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _controller,
              keyboardType: _keyboardType,
              decoration: _decoration,
              obscureText: _obscureText,
              maxLength: _maxLength,
              onChanged: (value) => setState(() => _inputValue = value),
            ),

            const SizedBox(height: 12),

            Text(
              'Valor digitado: $_inputValue',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
