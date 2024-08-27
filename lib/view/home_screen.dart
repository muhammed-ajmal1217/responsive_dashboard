import 'package:dashboard/model/sales_data_model.dart';
import 'package:dashboard/view/widgets/category_performance/category_performance.dart';
import 'package:dashboard/view/widgets/communications.dart';
import 'package:dashboard/view/widgets/products/frequently_bought_products.dart';
import 'package:dashboard/view/widgets/revenue_order_chart.dart';
import 'package:dashboard/view/widgets/side_bar_menu.dart';
import 'package:dashboard/view/widgets/top_buttons.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:flutter/material.dart';

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
        final int crossAxisCount = constraints.maxWidth > 1050 ? 3 : (isSmall ? 1 : 2);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.white,
            title: Card(
              color: Colors.white,
              shape: const LinearBorder(),
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
                  items: const [
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
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/profile_icon.jpg"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: 'Yupp!!'),
                        CustomText(text: 'Admin!!',size: 10,),
                      ],
                    )
                  ],
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
                SizedBox(
                  width: 50,
                  child: sideMenuBar(),
                ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                  const Color.fromARGB(255, 209, 255, 235),
                              title: 'Pre-Orders',
                              count: '3',
                              iconColor: Colors.green,
                              icon: Icons.mobile_screen_share,
                            ),
                            TopButtons(
                              iconBackgroundColor:
                                  const Color.fromARGB(255, 236, 255, 232),
                              title: 'Draft',
                              count: '3',
                              icon: Icons.note,
                              iconColor: Colors.green,
                            ),
                            TopButtons(
                                iconBackgroundColor:
                                    const Color.fromARGB(255, 236, 255, 232),
                                title: 'Cancelled',
                                count: '3',
                                icon: Icons.note,
                                iconColor: Colors.green),
                          ],
                        ),
                      ),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 6,
                          childAspectRatio: 3 / 2.5,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context, index) => [
                          const CategoryPerformance(),
                          RevenueAndOrderChart(
                            heading: 'Revenue',
                            chartData: [
                              SalesDataModel('Booking', 0),
                              SalesDataModel('Orders', 3329),
                            ],
                            categoryColors: const {
                              'Booking': Color.fromARGB(255, 18, 18, 75),
                              'Orders': Color.fromARGB(255, 219, 155, 45),
                            },
                          ),
                          Communication(),
                          const FrequentlyBoughtProducts(),
                          RevenueAndOrderChart(
                            heading: 'Collection',
                            chartData: [
                              SalesDataModel('Completed', 0),
                              SalesDataModel('Pending', 3359),
                              SalesDataModel('Due', 2356),
                              SalesDataModel('Overdue', 0),
                            ],
                            categoryColors: const {
                              'Completed': Color.fromARGB(255, 145, 156, 159),
                              'Pending': Color.fromARGB(255, 119, 0, 0),
                              'Due': Color.fromARGB(255, 204, 156, 60),
                              'Overdue': Color.fromARGB(255, 193, 156, 82),
                            },
                          ),
                          RevenueAndOrderChart(
                            heading: 'Order Status',
                            chartData: [
                              SalesDataModel('Processing', 0),
                              SalesDataModel('Packed For Delivery', 0),
                              SalesDataModel('Out of Delivery', 0),
                              SalesDataModel('Delivered', 2254),
                            ],
                            categoryColors: const {
                              'Processing': Color.fromARGB(255, 7, 25, 39),
                              'Packed For Delivery':
                                  Color.fromARGB(255, 38, 51, 114),
                              'Out of Delivery':
                                  Color.fromARGB(255, 179, 169, 75),
                              'Delivered': Color.fromARGB(255, 76, 160, 175),
                            },
                          ),
                        ][index],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
