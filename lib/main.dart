import 'package:fakewho/contract_linking.dart';
import 'package:fakewho/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContractLinking>(
      create: (context)=> ContractLinking(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FakeWho',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        
        home: HomePage(),
      ),
    );
  }
}

