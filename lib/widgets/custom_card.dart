import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const CustomCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final Color purple = Color(0xFF8E24AA);

    return Card(
      color: Colors.white,
      elevation: 4,
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: purple, width: 1),
      ),
      child: ListTile(
        leading: Icon(icon, color: purple, size: 35),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward, color: purple),
      ),
    );
  }
}