  import 'package:dashboard/model/sales_data_model.dart';

List<SalesDataModel> getTargetData() {
    return [
      SalesDataModel('Beauty Toys', 1100),
      SalesDataModel('Computer', 2000),
      SalesDataModel('Dress', 1100),
      SalesDataModel('Grocery', 1100),
      SalesDataModel('Home Appliances', 1100),
    ];
  }

  List<SalesDataModel> getProjectionData() {
    return [
      SalesDataModel('Beauty Toys', 0),
      SalesDataModel('Computer', 0),
      SalesDataModel('Dress', 0),
      SalesDataModel('Grocery', 0),
      SalesDataModel('Home Appliances', 0),
    ];
  }

  List<SalesDataModel> getActualData() {
    return [
      SalesDataModel('Beauty Toys', 0),
      SalesDataModel('Computer', 250),
      SalesDataModel('Dress', 0),
      SalesDataModel('Grocery', 2823),
      SalesDataModel('Home Appliances', 0),
    ];
  }