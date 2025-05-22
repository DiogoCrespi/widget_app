import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NewsDetailPage extends StatelessWidget {
  final String titulo;
  final String descricao;
  final String imagem;
  const NewsDetailPage({
    super.key,
    required this.titulo,
    required this.descricao,
    required this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes da Notícia')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 9. Categoria: Assets, Imagens e Ícones
            // Widget: Image
            // Exibição de imagem da notícia
            Image.network(
              imagem,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Categoria: Básicos
                  // Widget: Text
                  // Exibição do título da notícia
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // 1. Categoria: Básicos
                  // Widget: Text
                  // Exibição da descrição da notícia
                  Text(descricao, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 24),
                  // 4. Categoria: Botões
                  // Widget: ElevatedButton
                  // Botão de voltar alinhado à direita
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // 5. Categoria: Navegação e Rotas
                          // Widget: Navigator
                          // Volta para tela anterior usando pop
                          Navigator.pop(context);
                        },
                        child: const Text('Voltar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
