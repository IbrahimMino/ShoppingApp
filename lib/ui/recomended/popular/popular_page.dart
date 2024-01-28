import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({super.key});

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var width = mediaQueryData.size.width;
    var height = mediaQueryData.size.height;


    return Container();
  }

}
