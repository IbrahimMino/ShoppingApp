import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/models/Toggle.dart';

class Constants{

 static final List<String> listBanners =[
    'assets/images/frame1.png',
    'assets/images/frame2.png',
  ];

static Widget langButton(Toggle lang) {
   return Container(
       width: 40,
       height: 40,
       child: Center(
         child: Image.asset(lang.img_url.toString(),height: 28,width: 28,),
       ),
       decoration: BoxDecoration(
           shape: BoxShape.circle,
           border: Border(
             left: BorderSide(
               color: lang.isActive ? Color(0xffFF7011) : Colors.grey,
               width: lang.isActive ? 2 : 0.5,
             ),
             right: BorderSide(
               color: lang.isActive ? Color(0xffFF7011) : Colors.grey,
               width: lang.isActive ? 2 : 0.5,
             ),
             top: BorderSide(
               color: lang.isActive ? Color(0xffFF7011) : Colors.grey,
               width: lang.isActive ? 2 : 0.5,
             ),
             bottom: BorderSide(
               color: lang.isActive ? Color(0xffFF7011) : Colors.grey,
               width: lang.isActive ? 2 : 0.5,
             ),
           ),
       ));
 }


 static final List<Toggle> recommendProducts = [
   Toggle(img_url: 'assets/images/pl.png', isActive: true),
   Toggle(img_url: 'assets/images/iphone.png', isActive: false),
   Toggle(img_url: 'assets/images/sofa.png', isActive: false),
 ];

}