import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarkaradminapp/const/colors.dart';
import 'package:sarkaradminapp/fuctions/delproductfunction.dart';
import 'package:sarkaradminapp/views/category_screen/addcate.dart';
import 'package:sarkaradminapp/views/insidecategories/inside_category.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category List'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => Addcate());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('categories').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot documentsnampshot =
                        snapshot.data!.docs[index];

                    return Card(
                      color: kyellow,
                      child: ListTile(
                        onTap: () {
                          Get.to(
                            () => InsideCategory(
                                brand: documentsnampshot['name']),
                          );
                        },
                        title: Text(documentsnampshot['name'],
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        trailing: IconButton(
                            onPressed: () {
                              delectcategories(
                                  categories: documentsnampshot['name']);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: kred,
                            )),
                      ),
                    );
                  },
                );
              } else {
                return const Text('There is no Data');
              }
            }),
      ),
    );
  }
}
