import 'package:flutter/material.dart';

class RowContainers extends StatelessWidget {
  const RowContainers(
      {super.key,
      required this.text1,
      required this.text2,
      required this.icon1,
      required this.icon2});
  final String text1;
  final String text2;
  final IconData icon1;
  final IconData icon2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 156,
                width: 170,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon1,
                      color: Color.fromARGB(255, 16, 82, 136),
                    ),
                    Text(
                      text1,
                      style: TextStyle(color: Color.fromARGB(255, 16, 82, 136)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 156,
                width: 170,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon2,
                      color: Color.fromARGB(255, 16, 82, 136),
                    ),
                    Text(
                      text2,
                      style: TextStyle(color: Color.fromARGB(255, 16, 82, 136)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
