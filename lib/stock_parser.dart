class StockParser {
  static List<Map<String, dynamic>> parseGapUpStocks(Map<String, dynamic> data) {
    List<Map<String, dynamic>> gapUpStocks = [];
    var timeSeries = data['Time Series (1min)'] ?? data['Time Series (Daily)'];
    var previousClose = double.parse(timeSeries.entries.first.value['4. close']);
    
    timeSeries.forEach((time, values) {
      var open = double.parse(values['1. open']);
      if (open > previousClose) {
        gapUpStocks.add({'time': time, 'open': open, 'previousClose': previousClose});
      }
      previousClose = double.parse(values['4. close']);
    });

    return gapUpStocks;
  }
}

