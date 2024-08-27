import 'package:dashboard/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Communication extends StatelessWidget {
  Communication({super.key});

  final Map<String, String> items = {
    "Raj P": "BusikitSales",
    "Varun": "BusikitSales",
    "Arjun": "BusikitSales",
    "Joie": "BusikitSales",
    "Jacob": "BusikitSales",
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 233, 233, 233),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(7)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              textAlign: TextAlign.start,
              maxWidth: size.width <= 550 ? double.infinity : size.width * 0.4,
              text: 'Communications',
              overflow: true,
              fontWeight: FontWeight.w600,
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                String key = items.keys.elementAt(index);
                String value = items[key]!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 219, 219, 219),
                      ),
                    ),
                    title: CustomText(
                      text: key,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: CustomText(
                      textAlign: TextAlign.start,
                      text: value,
                      size: 13,
                    ),
                    leading: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 216, 241, 255),
                      child: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                    ),
                    trailing: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                        ),
                        SizedBox(width: 8),
                        CustomText(
                          text: '30/07/2024  17:50',
                          size: 12,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_rounded),
                  ),
                  const Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 219, 219, 219),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
