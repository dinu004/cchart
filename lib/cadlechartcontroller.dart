import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CandleChartController extends GetxController{

  int trade = 54;
  late List chartList=[];
  var random = Random();
  ChartSeriesController? chartSeriesController;
  late List<CandlesSampleData> candleChartData=<CandlesSampleData>[
    CandlesSampleData(
        x: DateTime.now().subtract(Duration(minutes: 1)),
        open: 54,
        high: 60,
        low: 50,
        close: 52),
  ];

  updateCandles() {
    int newTrade;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(chartList.length>=60){
        candleChartData.add(CandlesSampleData(x: DateTime.now(),open:chartList.first,close:chartList.last,high:chartList.reduce((curr, next) => curr < next? curr: next),low:chartList.reduce((curr, next) => curr > next? curr: next)));
        chartSeriesController?.updateDataSource(
          addedDataIndexes: <int>[candleChartData.length - 1],
        );
        chartList=[];
        newTrade=50+random.nextInt(100-50);
        if(trade<newTrade){
          trade=newTrade;
        }else{
          trade=newTrade;
        }
        chartList.add(trade);
        update();
      }else{
        newTrade=50+random.nextInt(100-50);
        if(trade<newTrade){
          trade=newTrade;
        }else{
          trade=newTrade;
        }
        chartList.add(trade);
        if(chartList.length>=4){
          candleChartData[candleChartData.length-1]=CandlesSampleData(x: DateTime.now(),open: chartList[0],close: chartList[chartList.length-1],high: chartList.reduce((curr, next) => curr < next? curr: next),low: chartList.reduce((curr, next) => curr > next? curr: next));
        }
        update();
      }
    });
  }


  @override
  void onInit() {
    updateCandles();
    // TODO: implement onInit
    super.onInit();
  }
}

class CandlesSampleData{
  CandlesSampleData({
    this.x,
    this.open,
    this.close,
    this.low,
    this.high,
  });

  final DateTime? x;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
}