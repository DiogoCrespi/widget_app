import 'package:flutter/material.dart';
import 'package:widget_app/DemoPage.dart';

class NavigatorWidgetPage extends StatelessWidget {
  const NavigatorWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Navigator',
      // Rotas nomeadas
      routes: {
        '/': (context) => const RecipeListPage(),
        '/details': (context) => const RecipeDetailPage(),
      },
      initialRoute: '/',
    );
  }
}

// Tela de lista de receitas
class RecipeListPage extends StatelessWidget {
  const RecipeListPage({super.key});

  final List<Map<String, String>> recipes = const [
    {
      'title': 'Bolo de Chocolate',
      'description': 'Receita deliciosa de bolo de chocolate fofinho.',
    },
    {
      'title': 'Salada Caesar',
      'description': 'Salada com alface, frango e molho Caesar.',
    },
    {
      'title': 'Macarrão ao Alho e Óleo',
      'description': 'Macarrão simples e rápido com alho e azeite.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Receitas')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(recipe['title']!),
              onTap: () {
                // Navegação passando dados usando push
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => RecipeDetailPage(
                          title: recipe['title']!,
                          description: recipe['description']!,
                        ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.home),
        label: const Text('Voltar ao Menu'),
        onPressed: () {
          // Exemplo de popUntil - volta até a raiz da navegação
          // Navigator.popUntil(context, (route) => route.isFirst);

          // Navegação para o menu principal, substituindo toda a pilha de navegação
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const DemoPage()),
            (route) => false,
          );
        },
      ),
    );
  }
}

// Tela de detalhes da receita
class RecipeDetailPage extends StatelessWidget {
  final String? title;
  final String? description;

  const RecipeDetailPage({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Detalhes da Receita'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? 'Sem título',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              description ?? 'Sem descrição disponível.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar'),
              onPressed: () {
                Navigator.pop(context); // Voltar para a lista
              },
            ),
          ],
        ),
      ),
    );
  }
}
