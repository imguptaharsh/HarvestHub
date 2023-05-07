import 'package:e_com/constants/global_variable.dart';
import 'package:e_com/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/loader.dart';
import '../models/sales.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import '../widgets/category_products_chart.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // var padding = MediaQuery.of(context).padding;
    // double newheight = height - padding.top;

    return earnings == null || totalSales == null
        ? const Loader()
        : Container(
            color: GlobalVariables.mainColor,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ignore: prefer_const_constructors

                    const Text(
                      'Total Selling:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$totalSales ₹',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 500,
                  child: CategoryProductsChart(seriesList: [
                    charts.Series(
                      id: 'Sales',
                      data: earnings!,
                      colorFn: (_, __) => charts.Color.fromHex(code: '#497D59'),
                      domainFn: (Sales sales, _) => sales.label,
                      measureFn: (Sales sales, _) => sales.earning,
                    ),
                  ]),
                )
              ],
            ),
          );
  }
}
