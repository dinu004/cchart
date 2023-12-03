import 'package:cchart/cadlechartcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CandleChartView extends StatelessWidget {
  CandleChartView({Key? key}) : super(key: key);

  CandleChartController candleChartController = Get.put(CandleChartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CandleChart'
        ),
      ),
      body: GetBuilder<CandleChartController>(
        builder: (controller) {
          return Center(
            child: SfCartesianChart(
              title: ChartTitle(text: 'Candlestick Chart'),
              legend: Legend(isVisible: true),
              series: <CandleSeries<CandlesSampleData, DateTime>>[
                CandleSeries<CandlesSampleData, DateTime>(
                  dataSource: controller.candleChartData,
                  xValueMapper: (CandlesSampleData data, _) => data.x,
                  openValueMapper: (CandlesSampleData data, _) => data.open,
                  highValueMapper: (CandlesSampleData data, _) => data.high,
                  lowValueMapper: (CandlesSampleData data, _) => data.low,
                  closeValueMapper: (CandlesSampleData data, _) => data.close,
                ),
              ],
              primaryXAxis: DateTimeAxis(),
            ),
          );
        }
      ),
    );
  }
}
