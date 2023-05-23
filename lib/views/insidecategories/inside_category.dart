import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkaradminapp/const/colors.dart';
import 'package:sarkaradminapp/fuctions/delproductfunction.dart';
import 'package:sarkaradminapp/model/product_model.dart';
import 'package:sarkaradminapp/views/addproduct/add_product.dart';
import 'package:sarkaradminapp/views/editscreen/edit_product.dart';
import 'package:sarkaradminapp/views/productdetails/view_product.dart';

class InsideCategory extends StatelessWidget {
  const InsideCategory({Key? key, required this.brand}) : super(key: key);

  final String brand;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brand.toString()),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => AddProduct(
                      brand: brand,
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: StreamBuilder<List<ProductModel>>(
            stream: FirebaseFirestore.instance
                .collection('categories')
                .doc(brand)
                .collection(brand)
                .snapshots()
                .map((event) => event.docs
                    .map((e) => ProductModel.fromJson(e.data()))
                    .toList()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    List<ProductModel> documentSnapshot = snapshot.data!;
                    return Card(
                      color: kblue,
                      child: ListTile(
                        onTap: () {
                          Get.to(() => ProductView(
                                productModel: ProductModel(
                                    name: documentSnapshot[index].name,
                                    doc: documentSnapshot[index].doc,
                                    price: documentSnapshot[index].price,
                                    imagelist:
                                        documentSnapshot[index].imagelist),
                              ));
                        },
                        title: Text(documentSnapshot[index].name,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.to(() => EditProduct(
                                      brand: brand,
                                      productModel: ProductModel(
                                          name: documentSnapshot[index].name,
                                          doc: documentSnapshot[index].doc,
                                          price: documentSnapshot[index].price,
                                          imagelist: documentSnapshot[index]
                                              .imagelist),
                                    ));
                              },
                              icon: const Icon(Icons.edit),
                              color: kwhite,
                            ),
                            IconButton(
                                onPressed: () {
                                  delproduct(
                                    brandname: brand,
                                    product: ProductModel(
                                        name: documentSnapshot[index].name,
                                        doc: documentSnapshot[index].doc,
                                        price: documentSnapshot[index].price,
                                        imagelist:
                                            documentSnapshot[index].imagelist),
                                  );

                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: kred,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Text('No Data');
              }
            }),
      ),
    );
  }
}
