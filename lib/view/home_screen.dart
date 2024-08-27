import 'package:dashboard/view/widgets/side_bar_menu.dart';
import 'package:dashboard/view/widgets/top_buttons.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmall = constraints.maxWidth <= 550;
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            title: Card(
              color: Colors.white,
              shape: LinearBorder(),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: DropdownButton<String>(
                  underline: Container(),
                  style: const TextStyle(color: Colors.black),
                  dropdownColor: Colors.white,
                  hint: const CustomText(
                    text: 'This Month',
                    size: 13,
                    color: Color.fromARGB(255, 121, 121, 121),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: '1',
                      child: Text('January'),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Text('February'),
                    ),
                  ],
                  onChanged: (value) {},
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/profile_icon.jpg"),
                ),
              )
            ],
          ),
          drawer: isSmall
              ? Drawer(
                  width: 20,
                  child: sideMenuBar(),
                )
              : null,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isSmall)
                Container(
                  width: 50,
                  child: sideMenuBar(),
                ),
              Expanded(
                  child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TopButtons(
                          iconBackgroundColor: Colors.red,
                          title: 'Orders',
                          count: '3',
                          icon: Icons.shopping_cart,
                          iconColor: Colors.red,
                        ),
                        TopButtons(
                          iconBackgroundColor: Colors.blue,
                          title: 'Estimates',
                          count: '3',
                          icon: Icons.edit_document,
                          iconColor: Colors.blue,
                        ),
                        TopButtons(
                          iconBackgroundColor:
                              Color.fromARGB(255, 209, 255, 235),
                          title: 'Pre-Orders',
                          count: '3',
                          iconColor: Colors.green,
                          icon: Icons.mobile_screen_share,
                        ),
                        TopButtons(
                          iconBackgroundColor:
                              Color.fromARGB(255, 236, 255, 232),
                          title: 'Draft',
                          count: '3',
                          icon: Icons.note,
                          iconColor: Colors.green,
                        ),
                        TopButtons(
                            iconBackgroundColor:
                                Color.fromARGB(255, 236, 255, 232),
                            title: 'Cancelled',
                            count: '3',
                            icon: Icons.note,
                            iconColor: Colors.green),
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}
