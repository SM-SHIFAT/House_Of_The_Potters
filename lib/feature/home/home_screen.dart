import 'package:flutter/material.dart';

import '../../Model/chracter_model.dart';
import '../../service/api_service.dart';
import '../details/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Chracter>> futureCharacters;

  @override
  void initState() {
    super.initState();
    futureCharacters = ApiService().fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter Characters'),
      ),
      body: FutureBuilder<List<Chracter>>(
        future: futureCharacters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No characters found'));
          } else {
            List<Chracter> characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                Chracter character = characters[index];
                return ListTile(
                  isThreeLine: true,
                  title: Text(character.name ?? ""),
                  subtitle: Text(
                      "Actor: ${character.actor}\nHouse: ${character.house}"),
                  leading: Hero(
                    tag: character.id!,
                    child: Image.network(
                      character.image ?? "https://placehold.co/600x400.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          chracter: character,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
