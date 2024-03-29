import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/constants/customer_list.dart';
import 'package:task/view/customer_screen/widget/bottomsheet.dart';
import 'package:task/view/customer_screen/widget/customer_container.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Center(
          child: Text(
            'Customers',
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
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(FontAwesomeIcons.qrcode),
                    SizedBox(width: 5),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return AddCustomerBottomSheet();
                          },
                        );
                      },
                      icon: Icon(FontAwesomeIcons.plus),
                    ),
                  ],
                ),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.grey.withOpacity(0.5),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
              ),
            ),
          ),
          CustomerContainer()
        ],
      ),
    );
  }
}
