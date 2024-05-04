import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({super.key});

  Future getProducts() async {
    var response = await http.get(Uri.http('127.0.0.1:8000', 'api-products'));
    var Data = jsonDecode(response.body);
    print(Data);
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    return Scaffold();
  }
}
