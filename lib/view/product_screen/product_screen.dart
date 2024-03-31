import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task/controllers/api_provider.dart';
import 'package:task/controllers/search_provider.dart';
import 'package:task/view/product_screen/widgets/pro.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    final pro = Provider.of<ApiProvider>(context, listen: false);
    pro.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final searchcontroller = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
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
              onChanged: (value) {
                searchcontroller.searchMovies(value);
              },
              style: const TextStyle(
                  color: Colors.black), // Text color when typing
              decoration: InputDecoration(
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        FontAwesomeIcons.qrcode,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Fruits',
                        style: TextStyle(),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.grey.withOpacity(0.5),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35))),
              ),
            ),
          ),
          Expanded(
              child: searchcontroller.searchResults.isEmpty
                  ? ProductContainer()
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        final searchData =
                            searchcontroller.searchResults[index];
                        Container(child: Text('${searchData.name}'));
                      },
                      itemCount: searchcontroller.searchResults.length,
                    ))
        ],
      ),
    );
  }
}
