import 'package:flutter/material.dart';
import 'widgets/custom_card.dart';

void main() {
  runApp(SuperiorXRApp());
}

class SuperiorXRApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SuperiorXR',
      theme: ThemeData(
        primaryColor: Color(0xFF6A1B9A),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Color primaryPurple = Color(0xFF6A1B9A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // 🔹 APPBAR
      appBar: AppBar(
        title: Text("SuperiorXR"),
        centerTitle: true,
        backgroundColor: primaryPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),

      // 🔹 BODY
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            const CustomCard(
              title: "AR Navigation",
              description: "Guide users using augmented reality",
              icon: Icons.navigation,
            ),

            const CustomCard(
              title: "Chatbot",
              description: "Ask location via chatbot",
              icon: Icons.chat_bubble,
            ),

            const CustomCard(
              title: "VR Tour",
              description: "Explore campus in virtual reality",
              icon: Icons.vrpano,
            ),
          ],
        ),
      ),
    );
  }
}