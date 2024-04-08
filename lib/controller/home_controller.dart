import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foot_admin/model/product/product.dart';
import 'package:foot_admin/pages/add_product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String test = 'test string';

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String gender = 'Both';
  String brand = 'un branded';
  bool offer = false;

  List<Product> products = [];

  @override
  void onInit() async {
    productCollection = firestore.collection('product');
    await fetchProducts();
    super.onInit();
  }

  AddProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
          id: doc.id,
          name: productNameCtrl.text,
          category: gender,
          description: productDescriptionCtrl.text,
          price: double.tryParse(productPriceCtrl.text),
          brand: brand,
          image: productImgCtrl.text,
          offer: offer);

      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product Added Successfully',
          colorText: Colors.green);
      setValuesDefault();
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar('Successful', 'Adding Products Successfully',
          colorText: Colors.green);
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProducts();
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  setValuesDefault() {
    productNameCtrl.clear();
    productDescriptionCtrl.clear();
    productPriceCtrl.clear();
    gender = 'Both';
    brand = 'un branded';
    offer = false;
    update();
  }
}
