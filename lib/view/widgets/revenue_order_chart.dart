import 'package:dashboard/model/sales_data_model.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RevenueAndOrderChart extends StatelessWidget {
  final String heading;
  final List<SalesDataModel> chartData;
  final Map<String, Color> categoryColors;

  const RevenueAndOrderChart({
    super.key,
    required this.chartData,
    required this.categoryColors,
    required this.heading,
  });

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
              overflow: true,
              text: heading,
              fontWeight: FontWeight.w600,
            ),
          ),
          Flexible(
            child: SfCircularChart(
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                legendItemBuilder:
                    (String name, dynamic series, dynamic point, int index) {
                  SalesDataModel data = chartData[index];
                  return Row(
                    children: <Widget>[
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: categoryColors[data.category],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text('${data.category}: ${data.value}'),
                    ],
                  );
                },
              ),
              series: <CircularSeries>[
                DoughnutSeries<SalesDataModel, String>(
                  legendIconType: LegendIconType.rectangle,
                  dataSource: chartData,
                  xValueMapper: (SalesDataModel data, _) => data.category,
                  yValueMapper: (SalesDataModel data, _) => data.value,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: false,
                  ),
                  innerRadius: '60%',
                  pointColorMapper: (SalesDataModel data, _) =>
                      categoryColors[data.category] ?? Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}