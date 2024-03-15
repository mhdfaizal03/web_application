import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web_application/databases/firebase_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirestoreServices firestoreServices = FirestoreServices();

  TextEditingController productController = TextEditingController();
  TextEditingController subProductController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  void getDialog(
      {String? docId,
      String? initialProduct,
      String? initialSubProduct,
      double? initialPrice}) {
    productController.text = initialProduct ?? '';
    subProductController.text = initialSubProduct ?? '';
    priceController.text = initialPrice != null ? initialPrice.toString() : '';
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: productController,
                  decoration: const InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: subProductController,
                  decoration: const InputDecoration(
                      hintText: 'subName',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: priceController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'price',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (docId == null) {
                      firestoreServices.addData(
                          productController.text,
                          subProductController.text,
                          double.parse(
                            priceController.text,
                          ));
                      productController.clear();
                      subProductController.clear();
                      priceController.clear();
                    } else {
                      firestoreServices.updateProducts(
                          productController.text,
                          subProductController.text,
                          docId.toString(),
                          double.parse(
                            priceController.text,
                          ));
                    }

                    Navigator.pop(context);
                  },
                  child:
                      docId == null ? const Text('add') : const Text('update'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('P R O D U C T S'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: firestoreServices.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List productlist = snapshot.data!.docs;
            return ListView.builder(
                itemCount: productlist.length,
                itemBuilder: (_, index) {
                  DocumentSnapshot doc = productlist[index];
                  String docId = doc.id;
                  Map<String, dynamic> mapData =
                      doc.data() as Map<String, dynamic>;
                  String product = mapData['name'];
                  String subPoduct = mapData['subName'];
                  double price = mapData['price'];
                  return ListTile(
                    title: Text(product),
                    subtitle: Text(subPoduct),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(price.toString()),
                        IconButton(
                            onPressed: () {
                              getDialog(
                                docId: docId,
                                initialProduct: product,
                                initialSubProduct: subPoduct,
                                initialPrice: price,
                              );
                            },
                            icon: const Icon(Icons.update)),
                        IconButton(
                            onPressed: () {
                              firestoreServices.deleteProducts(docId);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text('No products'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
