import 'package:flutter/material.dart';

class AddVoyageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Voyage'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nom Agence'),
            ),
            // Add more TextFields and input fields for other voyage details

            ElevatedButton(
              onPressed: () {
                // Handle form submission and send data to your backend API
                // You can use the http package or any other method to make API calls.
              },
              child: Text('Add Voyage'),
            ),
          ],
        ),
      ),
    );
  }
}
