import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/university_page_provider.dart';
import '../model/university_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UniversityPageProvider>(context, listen: false)
          .fetchUniversities();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Universidades'),
        actions: [
          IconButton(
            icon: Icon(context.watch<UniversityPageProvider>().isGridView
                ? Icons.list
                : Icons.grid_view),
            onPressed: () {
              Provider.of<UniversityPageProvider>(context, listen: false)
                  .toggleLayout();
            },
          )
        ],
      ),
      body: Consumer<UniversityPageProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.universities.isEmpty) {
            return const Center(
                child: Text("No se encontraron universidades."));
          }

          if (provider.isGridView) {
            return const Text("Esto es un gridView");
          } else {
            return ListView.builder(
              itemCount: provider.universities.length,
              itemBuilder: (context, index) {
                final University uni = provider.universities[index];

                return ListTile(
                  leading: const Icon(Icons.school, color: Colors.blue),
                  title: Text(uni.name),
                  subtitle: Text(uni.country),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "detail_page",arguments:uni.name
                    );
                    //print("Seleccionaste: ${uni.name}");
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
