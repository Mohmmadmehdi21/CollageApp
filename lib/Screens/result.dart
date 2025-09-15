import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  // Subject Result Card
  Widget _buildSubjectCard(String subject, int marks, int total, String grade) {
    return Card(
      color: const Color(0xFF211D37),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.assignment, color: Colors.purpleAccent, size: 30),
        title: Text(
          subject,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Marks: $marks / $total",
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Text(
          grade,
          style: const TextStyle(
            color: Colors.greenAccent,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
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
            "Result",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Semester Title
          const Text(
            "Semester 4",
            style: TextStyle(
              color: Colors.purpleAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          // Subjects
          _buildSubjectCard("Mathematics", 85, 100, "A"),
          _buildSubjectCard("Physics", 72, 100, "B+"),
          _buildSubjectCard("Chemistry", 65, 100, "B"),
          _buildSubjectCard("Computer Science", 90, 100, "A+"),
          _buildSubjectCard("English", 78, 100, "B+"),

          const SizedBox(height: 20),

          // Overall Result
          Card(
            color: const Color(0xFF211D37),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              leading: Icon(Icons.star, color: Colors.amberAccent, size: 30),
              title: Text(
                "Overall CGPA",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                "8.6",
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
