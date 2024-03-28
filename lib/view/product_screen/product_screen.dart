import 'package:flutter/material.dart';
import 'package:task/view/product_screen/widgets/product_container.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Center(
          child: Text(
            'Nesto Hypermarket',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.grey.withOpacity(0.5),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35)))),
            ),
          ),
          const ProductContainer()
        ],
      ),
    );
  }
}
