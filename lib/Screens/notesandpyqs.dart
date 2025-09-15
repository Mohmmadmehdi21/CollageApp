import 'package:flutter/material.dart';

class NotesAndPyqPage extends StatelessWidget {
  const NotesAndPyqPage({super.key});

  // Helper for Notes/PYQ Card
  Widget _buildFileCard(String title, String type, IconData icon, Color color) {
    return Card(
      color: const Color(0xFF211D37),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 30),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          type,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.download, color: Colors.purpleAccent),
          onPressed: () {
            // TODO: add file download/view functionality
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Notes & PYQs",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Notes Section
          const Text(
            "📘 Notes",
            style: TextStyle(color: Colors.purpleAccent, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          _buildFileCard("Mathematics Notes", "PDF - Algebra & Calculus", Icons.note, Colors.blueAccent),
          _buildFileCard("Physics Notes", "PDF - Mechanics & Thermodynamics", Icons.note, Colors.greenAccent),
          _buildFileCard("Computer Science Notes", "PDF - Data Structures", Icons.note, Colors.orangeAccent),

          const SizedBox(height: 24),

          // PYQ Section
          const Text(
            "📝 Previous Year Question Papers",
            style: TextStyle(color: Colors.purpleAccent, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          _buildFileCard("Mathematics PYQ", "2023 - Semester 2", Icons.description, Colors.redAccent),
          _buildFileCard("Physics PYQ", "2023 - Semester 2", Icons.description, Colors.tealAccent),
          _buildFileCard("Computer Science PYQ", "2023 - Semester 2", Icons.description, Colors.amberAccent),
        ],
      ),
    );
  }
}
