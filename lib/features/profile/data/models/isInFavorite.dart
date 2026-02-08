import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';

Future<bool> isInFavorite({required ProductModel? product}) async {
  final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('favorites')
      .where('name', isEqualTo: product?.productName)
      .limit(1)
      .get();

  final isFav = snapshot.docs.isNotEmpty;
  return isFav;
}
