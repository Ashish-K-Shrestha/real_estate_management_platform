import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    const HomeScreen(),
  ];

  String selectedCategory = 'All'; // Track selected category

  final List<Map<String, String>> estateData = [
    {
      'title':
          'Beautiful Kathmandu the heart of the city, with a breathtaking view',
      'category': 'City',
      'date': '2024-12-12',
      'image': 'assets/images/ktm city.jpg',
    },
    {
      'title': 'Beautiful Pokhara city view from the top of the hill',
      'category': 'City',
      'date': '2024-12-13',
      'image': 'assets/images/pokhara city.jpg',
    },
    {
      'title':
          'Beautiful Gorkha Bazar the heart of the city, with a breathtaking view',
      'category': 'City',
      'date': '2024-12-12',
      'image': 'assets/images/gorkha bazar.jpg',
    },
    {
      'title': 'Beautiful Chitwan city arial view',
      'category': 'City',
      'date': '2024-11-30',
      'image': 'assets/images/chitwan city.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(
                top: 8.5), // Adjust the top padding as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/REM-Np.png',
                  height: 50, // Adjust the height for better alignment
                ),
                const SizedBox(width: 8), // Space between logo and text
                const Text(
                  'Real Estate Management Platform',
                  style: TextStyle(
                    fontSize: 15, // Font size for the text
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B),
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          elevation: 1,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(Icons.notifications),
                color: const Color(0xFF0288D1),
                onPressed: () {
                  // Handle notification icon press
                  // For example, navigate to a notifications screen
                },
              ),
            ),
          ],
        ),
        body: _selectedIndex == 0
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Horizontal Category buttons with scroll
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildCategoryButton('All'),
                            _buildCategoryButton('City'),
                            _buildCategoryButton('Houses'),
                            _buildCategoryButton('Apartments'),
                            _buildCategoryButton('Mansion'),
                            _buildCategoryButton('Land'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Highlighted Estate
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/home_page.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 380,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Best location and place to find you dream affordable house',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Latest House Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Latest houses for sale',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {}, // Handle See More
                            child: const Text(
                              'See More >>',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Estate Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: estateData.length,
                        itemBuilder: (context, index) {
                          final estate = estateData[index];
                          return _buildEstate(
                            title: estate['title']!,
                            category: estate['category']!,
                            date: estate['date']!,
                            imagePath: estate['image']!,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            : lstBottomScreen[
                _selectedIndex], // Other screens for bottom navigation
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedCategory = category; // Update selected category
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedCategory == category
              ? const Color(0xFF00796B)
              : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: selectedCategory == category
                ? Colors.white
                : const Color(0xFF00796B),
          ),
        ),
      ),
    );
  }

  Widget _buildEstate({
    required String title,
    required String category,
    required String date,
    required String imagePath,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 35),
                Text(
                  '$category - $date',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
