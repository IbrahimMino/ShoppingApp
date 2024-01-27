import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
        body: Center(child: Text('Favorite Page', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),)
    ));
  }
}
