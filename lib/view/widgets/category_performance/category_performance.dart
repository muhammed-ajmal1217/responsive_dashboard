import 'package:dashboard/model/sales_data_model.dart';
import 'package:dashboard/view/widgets/category_performance/widgets/chart_datas.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategoryPerformance extends StatelessWidget {
  const CategoryPerformance({super.key});

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
              text: 'Category Performance Projection V/S Actuais',
              overflow: true,
              fontWeight: FontWeight.w600,
            ),
          ),
          Flexible(
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              primaryYAxis: const NumericAxis(
                minimum: 0,
                maximum: 3000,
                interval: 500,
              ),
              legend: const Legend(
                isVisible: true,
                position: LegendPosition.bottom,
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries>[
                ColumnSeries<SalesDataModel, String>(
                  legendIconType: LegendIconType.rectangle,
                  name: 'Target',
                  dataSource: getTargetData(),
                  xValueMapper: (SalesDataModel data, _) => data.category,
                  yValueMapper: (SalesDataModel data, _) => data.value,
                  color: const Color.fromARGB(255, 21, 76, 121),
                ),
                ColumnSeries<SalesDataModel, String>(
                  legendIconType: LegendIconType.rectangle,
                  name: 'Projection',
                  dataSource: getProjectionData(),
                  xValueMapper: (SalesDataModel data, _) => data.category,
                  yValueMapper: (SalesDataModel data, _) => data.value,
                  color: const Color.fromARGB(255, 31, 45, 86),
                ),
                ColumnSeries<SalesDataModel, String>(
                  legendIconType: LegendIconType.rectangle,
                  name: 'Actual',
                  dataSource: getActualData(),
                  xValueMapper: (SalesDataModel data, _) => data.category,
                  yValueMapper: (SalesDataModel data, _) => data.value,
                  color: const Color.fromARGB(255, 116, 165, 57),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
