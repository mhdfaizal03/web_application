import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  //reference
  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  //create
  Future<void> addData(String name, String subName, double price) {
    return products.add({
      'name': name,
      'subName': subName,
      'price': price,
    });
  }

  //read
  Stream<QuerySnapshot> getProducts() {
    final productStream = products
        .orderBy(
          'name',
          descending: true,
        )
        .snapshots();
    return productStream;
  }

  //update
  Future<void> updateProducts(
      String newProduct, String newSubProduct, String id, double newPrice) {
    return products.doc(id).update({
      'name': newProduct,
      'subName': newSubProduct,
      'price': newPrice,
    });
  }

  //delete
  Future<void> deleteProducts(String docId) {
    return products.doc(docId).delete();
  }
}
