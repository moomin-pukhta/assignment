

import 'package:assignment/login.dart';
import 'package:assignment/vendorBooks.dart';
import 'package:assignment/vendorPencil.dart';
import 'package:assignment/vendorPens.dart';
import 'package:flutter/material.dart';
import 'package:assignment/landing.dart';


void main(){
  runApp(MaterialApp(
     initialRoute : 'login',
    routes: {
      
      'landing': (context) =>  MyLanding(),
      'vendorPens' :(context) => vendorPens(),
      'vendorBooks' :(context) => vendorBooks(),
      'vendorPencil' :(context) => vendorPencil(),
      'login': (context)=> MyLogin(),
      'logout' :(context) => MyLogin()
      
      
    },
  ));
}