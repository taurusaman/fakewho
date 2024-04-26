import 'package:fakewho/registerpage.dart';
import 'package:fakewho/verifypage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductPage())),
                child: Container(
                  // alignment: MainAxisAlignment.center,
                  height: 200,
                  width: 300,
                  child: Card(
                    color: Color.fromARGB(255, 65, 138, 215),
                    shadowColor: Colors.black26,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Icon(
                             Icons.precision_manufacturing,
                         ),
                          Text(
                        'Manufacturer',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 30,),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VerifyProduct())),
                child: Container(
                  height: 200,
                  width: 300,
                  child: Card(
                    color: Color.fromARGB(255, 65, 138, 215),
                    shadowColor: Colors.black26,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Icon(
                             Icons.people,
                         ),
                          Text(
                        'Consumer',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerifyProduct(),
                    )),
                child: Container(
                  height: 200,
                  width: 300,
                  child: Card(
                    color: Color.fromARGB(255, 65, 138, 215),
                    shadowColor: Colors.black26,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Icon(
                             Icons.sell,
                         ),
                          Text(
                        'Reseller',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
