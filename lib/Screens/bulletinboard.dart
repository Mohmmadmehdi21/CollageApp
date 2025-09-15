import 'package:flutter/material.dart';

class BulletinBoardPage extends StatelessWidget {
  const BulletinBoardPage({super.key});

  // Helper for Notice Card
  Widget _buildNoticeCard(String title, String date, String desc, Color color, IconData icon) {
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
          "$date\n$desc",
          style: const TextStyle(color: Colors.white70),
        ),
        isThreeLine: true,
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
            "Bulletin Board",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Notice 1 - Important
          _buildNoticeCard(
            "Semester Exam Schedule Released",
            "10 Sept 2025",
            "End-sem exams will start from 5th Dec 2025. Check portal for detailed timetable.",
            Colors.redAccent,
            Icons.campaign,
          ),
          const SizedBox(height: 12),

          // Notice 2 - Holiday
          _buildNoticeCard(
            "Holiday Notice: Diwali Break",
            "05 Sept 2025",
            "College will remain closed from 28 Oct to 2 Nov 2025 for Diwali.",
            Colors.orangeAccent,
            Icons.event,
          ),
          const SizedBox(height: 12),

          // Notice 3 - General
          _buildNoticeCard(
            "Library New Arrivals",
            "02 Sept 2025",
            "New collection of Computer Science books are available in the library.",
            Colors.greenAccent,
            Icons.library_books,
          ),
        ],
      ),
    );
  }
}
