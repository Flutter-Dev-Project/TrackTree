import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
class TreeSuggestion extends StatefulWidget {
  const TreeSuggestion({super.key});

  @override
  State<TreeSuggestion> createState() => _TreeSuggestionState();
}

class _TreeSuggestionState extends State<TreeSuggestion> {
  PageController _pageController = PageController(viewportFraction: 0.7);



  final List<Map<String, String>> plants = [
    {
      'name': 'Monstera',
      'description': 'A tropical plant with large leaves.',
      'image': 'https://picsum.photos/200/300',
    },
    {
      'name': 'Fiddle Leaf Fig',
      'description': 'A popular indoor tree.',
      'image': 'https://example.com/fiddle_leaf_fig.jpg',
    },
    {
      'name': 'Snake Plant',
      'description': 'A hardy plant with upright leaves.',
      'image': 'https://example.com/snake_plant.jpg',
    },
    {
      'name': 'Pothos',
      'description': 'A versatile and easy-to-grow vine.',
      'image': 'https://example.com/pothos.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),

        title: Text('Plant Suggestion'),
        backgroundColor: Colors.green,
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          final plant = plants[index];
          final String imageUrl = plant['image'] ?? '';
          final String name = plant['name'] ?? 'Unknown Plant';
          final String description = plant['description'] ?? 'No description available.';

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (imageUrl.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.network(
                        imageUrl,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  SizedBox(height: 10),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: plants.length,
        itemWidth: MediaQuery.of(context).size.width * 0.7,
        itemHeight: MediaQuery.of(context).size.height * 0.5,
        layout: SwiperLayout.STACK,
        scrollDirection: Axis.horizontal,
      )
      ,
      backgroundColor: Colors.green[50],
    );
  }
}




