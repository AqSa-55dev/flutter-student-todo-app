import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  Widget studentCard(String name, String rollNo, String dob) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Name: $name', style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('DOB: $dob', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Roll No: $rollNo', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('TO DO LIST'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Students',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          studentCard('Aqsa', 'CS-101', '18/07/2002'),
          studentCard('Hiba', 'CS-102', '22/04/2002'),
          studentCard('Sara', 'CS-103', '05/11/2003'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
      ),
    );
  }
}