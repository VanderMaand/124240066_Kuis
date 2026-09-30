import 'package:flutter/material.dart';

import '../data/pokemon.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon List')),
      body: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (context, i) {
          final p = pokemonList[i];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Image.network(
                p.image,
                width: 56,
                height: 56,
                errorBuilder: (_, _, _) =>
                    const Icon(Icons.broken_image, size: 56),
              ),
              title: Text(
                p.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(p.types.join(', ')),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailPage(pokemon: p)),
              ),
            ),
          );
        },
      ),
    );
  }
}
