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
            return const Center(child: Text("No se encontraron universidades."));
          }

          if (provider.isGridView) {
            return _buildGridView(provider.universities);
          } else {
            return _buildListView(provider.universities);
          }
        },
      ),
    );
  }

  
  Widget _buildListView(List<University> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final University uni = list[index];

        return ListTile(
          leading: const Icon(Icons.school, color: Colors.blue),
          title: Text(uni.name),
          subtitle: Text(uni.country),
          onTap: () {
            
            Navigator.pushNamed(
              context,
              "detail_page", 
              arguments: uni.name,
            );
          },
        );
      },
    );
  }

    
  Widget _buildGridView(List<University> list) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final University uni = list[index];
        
        return GestureDetector(
          onTap: () {
          
            Navigator.pushNamed(
              context,
              "detail_page", 
              arguments: uni.name,
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text(
                    uni.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 16
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 5), 

                 
                  Text(
                    uni.country,
                    style: const TextStyle(
                      fontSize: 12, 
                      color: Colors.grey 
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

