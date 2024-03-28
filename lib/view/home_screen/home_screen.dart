import 'package:flutter/material.dart';
import 'package:task/view/home_screen/widgets/row_containers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/image/MESSI.jpg'),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const RowContainers(
                  text1: 'Customers',
                  text2: 'Products',
                  icon1: Icons.groups,
                  icon2: Icons.indeterminate_check_box),
              const RowContainers(
                  text1: 'New Order',
                  text2: 'Return Order',
                  icon1: Icons.post_add_outlined,
                  icon2: Icons.subdirectory_arrow_left_rounded),
              const RowContainers(
                  text1: 'Add Payment',
                  text2: "Today's Order",
                  icon1: Icons.payment,
                  icon2: Icons.domain_verification_outlined),
              const RowContainers(
                  text1: "Today's Summery",
                  text2: 'Route',
                  icon1: Icons.summarize,
                  icon2: Icons.route_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
