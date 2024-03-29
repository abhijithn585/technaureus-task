import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/model/customer_model.dart';
import 'package:task/service/api_service.dart';
import 'package:task/view/customer_screen/widget/customer_container.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController streetTwoController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController countyController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
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
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(FontAwesomeIcons.qrcode),
                    const SizedBox(width: 5),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Add Customer',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      TextFormField(
                                        controller: nameController,
                                        decoration: const InputDecoration(
                                            labelText: 'Customer Name'),
                                      ),
                                      const SizedBox(height: 10),
                                      TextFormField(
                                        controller: numberController,
                                        decoration: const InputDecoration(
                                            labelText: 'Number'),
                                        keyboardType: TextInputType.phone,
                                      ),
                                      const SizedBox(height: 10),
                                      TextFormField(
                                        controller: emailController,
                                        decoration:
                                            const InputDecoration(labelText: 'Email'),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Address',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: streetController,
                                              decoration: const InputDecoration(
                                                  labelText: 'Street'),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: TextFormField(
                                              controller: streetTwoController,
                                              decoration: const InputDecoration(
                                                  labelText: 'Street 2'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: cityController,
                                              decoration: const InputDecoration(
                                                  labelText: 'City'),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: TextFormField(
                                              controller: pinCodeController,
                                              decoration: const InputDecoration(
                                                  labelText: 'Pin Code'),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child:
                                                DropdownButtonFormField<String>(
                                              decoration: const InputDecoration(
                                                labelText: 'Country',
                                              ),
                                              items: <String>[
                                                'USA',
                                                'Canada',
                                                'UK',
                                                'India'
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {},
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child:
                                                DropdownButtonFormField<String>(
                                              decoration: const InputDecoration(
                                                labelText: 'State',
                                              ),
                                              items: <String>[
                                                'State 1',
                                                'State 2',
                                                'State 3'
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            createCustomer();
                                          },
                                          child: const Text('Submit'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            ;
                          },
                        );
                      },
                      icon: const Icon(FontAwesomeIcons.plus),
                    ),
                  ],
                ),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.grey.withOpacity(0.5),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
              ),
            ),
          ),
          const CustomerContainer()
        ],
      ),
    );
  }

  createCustomer() {
    final name = nameController.text;
    final number = numberController.text;
    final email = emailController.text;
    final street = streetController.text;
    final streetTwo = streetTwoController.text;
    final city = cityController.text;
    final pincode = int.tryParse(pinCodeController.text);
    ApiService().createCustomer(CustomerModel(
        name: name,
        number: number,
        email: email,
        street: street,
        streetTwo: streetTwo,
        city: city,
        pincode: pincode));
    Navigator.pop(context);
  }
}
