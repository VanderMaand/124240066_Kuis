import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/pokemon.dart';
import 'package:flutter_application_1/pages/login_page.dart';

import '../pages/detail_page.dart';
import '../data/pokemon_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
        actions: [
          IconButton(
            tooltip: 'LogOut',
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      // body: ListView.builder(
      //   padding: const EdgeInsets.all(12),
      //   itemCount: pokemonList.length,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 1, // 2 kolom
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //     mainAxisExtent: 280, // tinggi tetap tiap kartu
      //   ),
      //   // itemBuilder dipanggil hanya untuk item yang tampak di layar.
      //   itemBuilder: (context, index) {
      //     final animal = pokemonList[index];
      //     return PokemonCard(
      //       animal: animal,
      //       // Navigator.push: halaman detail ditumpuk di atas Home,
      //       // sehingga tombol back otomatis kembali ke Home.
      //       onTap: () => Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (_) => AnimalDetailPage(animal: animal),
      //         ),
      //       ),
      //     );
      //   },
      // ),
      body: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    pokemon: Pokemon(
                      id: index,
                      name: pokemonList[index].name,
                      image: pokemonList[index].image,
                      types: pokemonList[index].types,
                      height: pokemonList[index].height,
                      weight: pokemonList[index].weight,
                      ability: pokemonList[index].ability,
                    ),
                  ),
                ),
              );
            },
            title: Text(pokemonList[index].name),
            leading: Image.network(
              pokemonList[index].image,
              width: 50,
              height: 50,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: const Color.fromARGB(255, 138, 115, 115),
            ),
          );
        },
      ),
    );
  }
}
