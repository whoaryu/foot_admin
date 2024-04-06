import 'package:flutter/material.dart';
import 'package:foot_admin/controller/home_controller.dart';
import 'package:foot_admin/pages/add_product.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(title: Text('Footware Admin')),
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('hello'),
                subtitle: Text('Price: 100'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    print('delete');
                    //ctrl.testMethod();
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(AddProduct());
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
