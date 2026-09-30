import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;
  const DetailPage({super.key, required this.pokemon});

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(': '),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(
              pokemon.image,
              height: 240,
              errorBuilder: (_, _, _) =>
                  const Icon(Icons.broken_image, size: 120),
            ),
            const SizedBox(height: 16),
            _row('ID', '#${pokemon.id}'),
            _row('Name', pokemon.name),
            _row('Types', pokemon.types.join(', ')),
            _row('Height', '${pokemon.height}'),
            _row('Weight', '${pokemon.weight}'),
            _row('Ability', pokemon.ability),
            _row('Image URL', pokemon.image),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
