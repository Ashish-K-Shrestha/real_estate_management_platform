import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  List<Map<String, dynamic>> products = [];
  List<Map<String, dynamic>> filteredProducts = [];
  bool isLoading = true;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch products initially but don't display them until a search is made
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/api/listing/getAllProduct'),
        headers: {"Content-Type": "application/json"},
      );

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);

        setState(() {
          products = List<Map<String, dynamic>>.from(responseData);
          filteredProducts = List<Map<String, dynamic>>.from(
              responseData); // Initialize filtered products with all products
          isLoading = false;
        });
      } else {
        print("Error fetching products: ${response.body}");
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Exception while fetching products: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  // Method to filter products based on search query
  void filterProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredProducts = [];
      });
    } else {
      final filtered = products.where((product) {
        final productName = product['name'].toString().toLowerCase();
        return productName.contains(query.toLowerCase());
      }).toList();

      setState(() {
        filteredProducts = filtered;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (query) {
                filterProducts(query); // Update the list as user types
              },
              decoration: const InputDecoration(
                labelText: 'Search Estate',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Display products only after search query is entered
          filteredProducts.isEmpty && searchController.text.isNotEmpty
              ? const Center(child: Text("No Products Found"))
              : Expanded(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          padding: const EdgeInsets.all(10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            final product = filteredProducts[index];
                            String imageUrl = product['image'] != null
                                ? 'http://10.0.2.2:3000/product_type_images/${product['image']}'
                                : 'https://via.placeholder.com/150';
                            print("Image URL: $imageUrl");

                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(15)),
                                      child: CachedNetworkImage(
                                        imageUrl: imageUrl,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                                Icons.image_not_supported,
                                                size: 50,
                                                color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          product['name']?.toString() ??
                                              "No Name",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Rs: ${product['price']?.toString() ?? "0"}",
                                          style: const TextStyle(
                                              fontSize: 14, color: Colors.teal),
                                        ),
                                        Text(
                                          product['phone']?.toString() ??
                                              "No Phone",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          product['description']?.toString() ??
                                              "No description",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                ),
        ],
      ),
    );
  }
}
