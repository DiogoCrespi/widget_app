import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:widget_app/newsdetailspage.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;
  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isExpanded = false;

  final List<Map<String, String>> noticias = [
    {
      'titulo': 'Título da Notícia Principal',
      'descricao':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'imagem': 'https://picsum.photos/600/180?1',
    },
    {
      'titulo': 'Economia em Alta',
      'descricao':
      'Mercado financeiro apresenta crescimento significativo neste trimestre.',
      'imagem': 'https://picsum.photos/600/180?2',
    },
    {
      'titulo': 'Tecnologia: Novidades',
      'descricao':
      'Novos lançamentos de smartphones prometem revolucionar o mercado.',
      'imagem': 'https://picsum.photos/600/180?3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notícias do Dia',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // 2. Categoria: Layout
          // Widget: Column
          // Organização vertical dos elementos da tela
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              // 8. Categoria: Acessibilidade
              // Widget: Semantics
              // Melhora a acessibilidade do campo de busca
              child: Semantics(
                label: 'Campo de busca de notícias',
                hint: 'Digite para buscar notícias',
                // 3. Categoria: Entrada
                // Widget: TextField
                // Campo de busca com controller, decoration e onChanged
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar notícias...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: isDark ? const Color(0xFF23272A) : Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),
            // 6. Categoria: Animação e Movimento
            // Widget: AnimatedContainer
            // Card de notícia expansível com animação
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: noticias.length,
              itemBuilder: (context, index) {
                final noticia = noticias[index];
                final bool isFirst = index == 0;
                return GestureDetector(
                  onTap:
                  isFirst
                      ? () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  }
                      : null,
                  // 8. Categoria: Acessibilidade
                  // Widget: Semantics
                  // Melhora a acessibilidade do card de notícia
                  child: Semantics(
                    label: 'Card de notícia',
                    hint: isFirst ? 'Toque para expandir ou recolher' : null,
                    enabled: true,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF23272A) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 9. Categoria: Assets, Imagens e Ícones
                          // Widget: Image
                          // Exibição de imagem da notícia
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              noticia['imagem']!,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // 1. Categoria: Básicos
                          // Widget: Text
                          // Exibição do título da notícia com style
                          Text(
                            noticia['titulo']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // 1. Categoria: Básicos
                          // Widget: Text
                          // Exibição da descrição da notícia com maxLines, overflow e style
                          Text(
                            noticia['descricao']!,
                            maxLines: isFirst && _isExpanded ? 5 : 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: isDark ? Colors.white70 : Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            // 4. Categoria: Botões
                            // Widget: ElevatedButton
                            // Botão de ação com onPressed, child e style
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                isDark ? Colors.blue[400] : Colors.blue,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                // 5. Categoria: Navegação e Rotas
                                // Widget: Navigator
                                // Navegação para tela de detalhes usando push
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => NewsDetailPage(
                                      titulo: noticia['titulo']!,
                                      descricao: noticia['descricao']!,
                                      imagem: noticia['imagem']!,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Leia mais'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Center(
                // 10. Categoria: Cupertino (iOS-style Widgets)
                // Widget: CupertinoButton
                // Botão estilizado conforme diretrizes do iOS
                child: CupertinoButton(
                  color: Colors.blue,
                  onPressed: () {
                    // Ação do botão
                  },
                  child: const Text('Compartilhar Notícia'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}