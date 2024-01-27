import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(child: Text('Basket Page', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),)
      ),
    );
  }
}
