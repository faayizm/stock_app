import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'api_service.dart';
import 'stock_parser.dart';

const String fetchStocksTask = "fetchStocksTask";

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchStocksTask:
        ApiService apiService = ApiService();
        var data = await apiService.fetchIntradayData('RELIANCE');
        var gapUpStocks = StockParser.parseGapUpStocks(data);
        // You can add logic to save or process the gapUpStocks
        break;
    }
    return Future.value(true);
  });
}

void initializeBackgroundService() {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  Workmanager().registerPeriodicTask(
    "1",
    fetchStocksTask,
    frequency: Duration(minutes: 15),
  );
}

