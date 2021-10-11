import 'package:admin_resto_app/src/auth/local_storage.dart';
import 'package:admin_resto_app/src/providers/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RequestUser{
  Future<String?>? getRestaurant(BuildContext context,String mail) async{
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var user = await users.doc(mail).get();
    Map<String, dynamic> restaurant = user.data() as Map<String, dynamic>;
    authProvider.restaurantName = restaurant['restaurant_name'];
    authProvider.restaurantPath = restaurant['restaurant'];
    LocalStorage.prefs.setString('restaurantPath', restaurant['restaurant']);
    LocalStorage.prefs.setString('restaurantName', restaurant['restaurant_name']);
    return null;
  }
}