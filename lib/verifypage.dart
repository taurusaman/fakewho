import 'package:flutter/material.dart';

class VerifyProduct extends StatelessWidget {
  const VerifyProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Enter product id to verify'),
              TextFormField(),
              TextButton(onPressed: (){}, child: Text('Verify Product'))
            ],
          ),
        ),
      ),
    );
  }
}