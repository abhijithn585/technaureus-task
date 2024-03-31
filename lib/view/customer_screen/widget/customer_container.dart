import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controllers/api_provider.dart';


class CustomerContainer extends StatelessWidget {
  const CustomerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Consumer<ApiProvider>(builder: (context, value, child) {
      return ListView.builder(
        itemCount: value.customer!.length,
        itemBuilder: (context, index) {
          final customers =value. customer![index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: customers.profile != null
                                  ? Image.network(
                                      'http://143.198.61.94${customers.profile}')
                                  : Image.asset("assets/image/profile.png")),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                customers.name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              const Icon(Icons.phone)
                            ],
                          ),
                          Text('id:${customers.id!}'),
                          Row(
                            children: [
                              Text(customers.street!),
                              Text(',${customers.streetTwo},'),
                              Text('${customers.state}')
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                'Due Amount: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          );
        },
      );
    }));
    // } else {
    //   return Center(
    //     child: Text(snapshot.error.toString()),
    //   );
  }
  // },
  // );
}
// }
