import 'package:flutter/material.dart';
import 'contract_linking.dart'; // Import your ContractLinking class

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String productName = '';
  String manufacturingDate = '';
  String manufacturerName = ''; // Added field for manufacturer's name
  String productId = '';
  String manufacturer = '';
  bool isProductRegistered = false;

  final ContractLinking contractLinking = ContractLinking();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Product Registration & Verification'),
        backgroundColor: Color.fromARGB(255, 65, 138, 215),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Card(
              borderOnForeground: true,
              shadowColor: Colors.black,
              color: Color.fromARGB(255, 65, 138, 215),
              child: Container(
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          productName = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Product Name',
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          manufacturingDate = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Manufacturing Date',
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          manufacturerName = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText:
                            'Manufacturer Name', // Added label for manufacturer's name field
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _registerProduct(productName, manufacturingDate,
                    manufacturerName); // Updated method call to include manufacturer's name
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(255, 65, 138, 215),
              )),
              child: Text('Register Product'),
            ),

            
            SizedBox(height: 40.0),
            Card(child: TextField(
              onChanged: (value) {
                setState(() {
                  productId = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Product ID',
              ),
            ),),
            
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _verifyProduct(productId);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(255, 65, 138, 215),
              )),
              child: Text('Verify Product'),
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: isProductRegistered,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product Name: $productName'),
                  Text('Manufacturing Date: $manufacturingDate'),
                  Text('Manufacturer: $manufacturer'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _registerProduct(
      String productName, String manufacturingDate, String manufacturerName) {
    // Updated method signature to include manufacturer's name parameter
    // Call ContractLinking setMessage function to register a new product
    contractLinking.setMessage(
        '$productName - $manufacturingDate - $manufacturerName'); // Updated message format to include manufacturer's name

    // Show success message or navigate to another screen upon successful registration
    // For demonstration, we'll simply display a toast message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Product registered successfully'),
      ),
    );
  }

  void _verifyProduct(String productId) {
    // Call ContractLinking setMessage function to update product details
    contractLinking.setMessage(productId);

    // Update product details based on the result
    setState(() {
      // Mock data for demonstration
      productName = 'Product Name';
      manufacturingDate = 'Manufacturing Date';
      manufacturer = 'Manufacturer';
      isProductRegistered = true;
    });
  }
}
