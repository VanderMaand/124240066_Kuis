import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name)),
      body: Center(child: Image.network(pokemon.image)),
    );
  }
}
