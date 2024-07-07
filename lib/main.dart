import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'background_service.dart';
import 'api_service.dart';
import 'stock_parser.dart';

void main() {
  initializeBackgroundService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StockProvider()),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

// ... rest of the HomePage and StockProvider classes

