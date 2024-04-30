import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:fetching_api/model/products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Products> products = [];

  // get products
  Future getProducts() async {
    var response = await http.get(Uri.https("dummyjson.com", 'products'));
    var jsonData = jsonDecode(response.body);

    for (var eachProduct in jsonData['products']) {
      final product = Products(
        id: eachProduct['id'],
        title: eachProduct['title'],
        price: eachProduct['price'],
        description: eachProduct['description'],
        thumbnail: eachProduct['thumbnail'],
      );
      products.add(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Xudayfi Shop'),
        elevation: 0,
        backgroundColor: Colors.deepPurple[400],
        leading: const Icon(Icons.menu),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 12, bottom: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[500],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: ClipOval(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.network(products[index].thumbnail,
                              fit: BoxFit.fill),
                        ),
                      ),
                      title: Text(
                        products[index].title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        products[index].description,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 212, 212, 212),
                        ),
                      ),
                      trailing: Text(
                        '${NumberFormat.currency(locale: 'en_US', symbol: '', decimalDigits: 0).format(products[index].price)} \$',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
