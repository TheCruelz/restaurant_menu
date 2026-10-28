import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card 1: Vegetable Pizza
            FoodCard(
              foodName: 'Vegetable Pizza',
              imageUrl: 'https://www.orchidsandsweettea.com/wp-content/uploads/2019/05/Veggie-Pizza-2-of-5-e1691215701129.jpg',
              description: 'A delicious blend of fresh garden vegetables, rich tomato sauce, and mozzarella cheese.',
              price: 'RM 12.99',
            ),
            const SizedBox(height: 16),
            // Card 2: Chicken Pizza
            FoodCard(
              foodName: 'Chicken Pizza',
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBkz7J03ZWuQEaIag_EYovjPtcx0PX5WilmUwmLroYbQ&s=10',
              description: 'Topped with tender grilled chicken chunks, onions, bell peppers, and melted cheese.',
              price: 'RM 14.99',
            ),
            const SizedBox(height: 16),
            // Card 3: Cheese Pizza
            FoodCard(
              foodName: 'Cheese Pizza',
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQw0Whrp1L4s8mh0D9WC43iW43DnmlaBuDy0n36Tz8mw&s=10',
              description: 'Classic cheesy goodness loaded with a generous layer of mozzarella and cheddar cheese.',
              price: 'RM 10.99',
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Food Card Widget with Network Image
class FoodCard extends StatelessWidget {
  final String foodName;
  final String imageUrl;
  final String description;
  final String price;

  const FoodCard({
    super.key,
    required this.foodName,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Navigation to Detail Screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailScreen(
                foodName: foodName,
                imageUrl: imageUrl,
                description: description,
                price: price,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Food Image from Link
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 80,
                    color: Colors.orange[300],
                    child: const Icon(Icons.local_pizza, color: Colors.white, size: 40),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              // Food Title
              Expanded(
                child: Text(
                  foodName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white70),
            ],
          ),
        ),
      ),
    );
  }
}

// Detail Screen for Optional Navigation Task
class FoodDetailScreen extends StatelessWidget {
  final String foodName;
  final String imageUrl;
  final String description;
  final String price;

  const FoodDetailScreen({
    super.key,
    required this.foodName,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              foodName,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: const TextStyle(fontSize: 22, color: Colors.deepOrange, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}