import 'package:flutter/material.dart';
import 'login.aluno.dart';
import 'professor.dart';
import 'coordenador.dart';
import 'pais.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '🎓 Pers💡naSesi',
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {
        '/aluno': (context) => const AreaAlunoPage(),
        '/professor': (context) => const AreaProfessorPage(),
        '/coordenador': (context) => const AreaCoordenadorPage(),
        '/pais': (context) => const AreaPaisPage(),
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🎓 Pers💡naSesi'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCard(
              context,
              icon: Icons.school,
              title: 'Área do Aluno',
              route: '/aluno',
            ),
            _buildCard(
              context,
              icon: Icons.people,
              title: 'Área do Professor',
              route: '/professor',
            ),
            _buildCard(
              context,
              icon: Icons.settings,
              title: 'Área do Coordenador',
              route: '/coordenador',
            ),
            _buildCard(
              context,
              icon: Icons.favorite,
              title: 'Área dos Pais',
              route: '/pais',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, route);
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}

class AreaAlunoPage extends StatelessWidget {
  const AreaAlunoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Área do Aluno')),
      body: const Center(
        child: Text(
          'Bem-vindo à Área do Aluno',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}

class AreaProfessorPage extends StatelessWidget {
  const AreaProfessorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Área do Professor')),
      body: const Center(
        child: Text(
          'Bem-vindo à Área do Professor',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}

class AreaCoordenadorPage extends StatelessWidget {
  const AreaCoordenadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Área do Coordenador')),
      body: const Center(
        child: Text(
          'Bem-vindo à Área do Coordenador',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}

class AreaPaisPage extends StatelessWidget {
  const AreaPaisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Área dos Pais')),
      body: const Center(
        child: Text(
          'Bem-vindo à Área dos Pais',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
