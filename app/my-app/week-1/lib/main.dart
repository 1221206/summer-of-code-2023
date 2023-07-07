import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      home: ProductListingPage(),
    );
  }
}

class ProductListingPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      title: 'Bicycle',
      description: 'A new bicycle for sale.',
      price: 100,
      image: 'images/bicycle.png',
    ),
    Product(
      title: 'Phone',
      description: 'A new phone for sale.',
      price: 500,
      image: 'images/phone.png',
    ),
    Product(
      title: 'Computer',
      description: ' Computer for sale.',
      price: 1000,
      image: 'images/computer.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
      ),
      body: ListView(
        children: products
          .map((product) => ProductListItem(product))
          .toList(),
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(product.image),
        title: Text(product.title),
        subtitle: Text(product.description),
        trailing: Text('\$${product.price}'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(product),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(product.image),
              Text(product.description),
              Text('\$${product.price}'),
              ElevatedButton(
                child: Text('Add to Cart'),
                onPressed: () {
                  // Add the product to the cart.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Product {
  final String title;
  final String description;
  final int price;
  final String image;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });
}

