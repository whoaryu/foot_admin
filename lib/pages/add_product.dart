import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),
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
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: Text('Product Name'),
                hintText: 'Enter your product name',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
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
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: Text('Image URL'),
                hintText: 'Enter your image URL',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: Text('Price'),
                hintText: 'Enter your price',
              ),
            ),
          ],
        ),
      )),
    );
  }
}
