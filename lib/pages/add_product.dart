import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:foot_admin/controller/home_controller.dart';
import 'package:foot_admin/widgets/dropdown.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        //: AppBar(title: Text('Add Product')),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(10),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Add a new Product',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrl.productNameCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: Text('Product Name'),
                  hintText: 'Enter your product name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrl.productDescriptionCtrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Description'),
                    hintText: 'Enter your product description'),
                maxLines: 4,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrl.productImgCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: Text('Image URL'),
                  hintText: 'Enter your image URL',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrl.productPriceCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: Text('Price'),
                  hintText: 'Enter your price',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                      child: dropdownbtn(
                    items: ['Male', 'Female', 'Both'],
                    selectedItemText: ctrl.gender,
                    onselected: (selectedvalu) {
                      ctrl.gender = selectedvalu ?? 'both';
                      print(selectedvalu);
                      ctrl.update();
                    },
                  )),
                  Flexible(
                      child: dropdownbtn(
                    items: ['Nike', 'Fila', 'Reebok', 'Adidas'],
                    selectedItemText: ctrl.brand,
                    onselected: (selectedvalu) {
                      ctrl.brand = selectedvalu ?? 'un branded';
                      ctrl.update();
                    },
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text('Offer Product?'),
              dropdownbtn(
                items: ['true', 'false'],
                selectedItemText: ctrl.offer.toString(),
                onselected: (selectedvalu) {
                  ctrl.offer = bool.tryParse(selectedvalu ?? 'false') ?? false;
                  ctrl.update();
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    ctrl.AddProduct();
                  },
                  child: Text('Add Product'))
            ],
          ),
        )),
      );
    });
  }
}
