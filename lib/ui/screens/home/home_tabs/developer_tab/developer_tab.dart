import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage("https://th.bing.com/th?id=OIP.n-r4h-GnyNgi3uPqZIgBlgHaLH&w=204&h=306&c=8&rs=1&qlt=90&o=6&dpr=1.1&pid=3.1&rm=2")
            ),
            SizedBox(height: 20),
            Text(
              'Shaimaa Mohamed ',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Passionate about creating beautiful apps',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}