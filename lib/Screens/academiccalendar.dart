import 'package:flutter/material.dart';

class AcademicCalendarPage extends StatelessWidget {
  const AcademicCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Academic Calendar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Semester Dates
          Card(
            color: const Color(0xFF211D37),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              leading: Icon(Icons.school, color: Colors.purpleAccent),
              title: Text("Semester Duration",
                  style: TextStyle(color: Colors.white)),
              subtitle: Text("01 Aug 2025 - 15 Dec 2025",
                  style: TextStyle(color: Colors.white70)),
            ),
          ),
          const SizedBox(height: 12),

          // Mid Term Exams
          Card(
            color: const Color(0xFF211D37),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              leading: Icon(Icons.edit_calendar, color: Colors.purpleAccent),
              title: Text("Mid-Term Exams",
                  style: TextStyle(color: Colors.white)),
              subtitle: Text("15 Oct 2025 - 20 Oct 2025",
                  style: TextStyle(color: Colors.white70)),
            ),
          ),
          const SizedBox(height: 12),

          // End Term Exams
          Card(
            color: const Color(0xFF211D37),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              leading: Icon(Icons.assignment, color: Colors.purpleAccent),
              title: Text("End-Term Exams",
                  style: TextStyle(color: Colors.white)),
              subtitle: Text("05 Dec 2025 - 15 Dec 2025",
                  style: TextStyle(color: Colors.white70)),
            ),
          ),
          const SizedBox(height: 12),

          // Holidays
          const Text(
            "Holidays",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Card(
            color: const Color(0xFF211D37),
            child: const ListTile(
              leading: Icon(Icons.beach_access, color: Colors.orangeAccent),
              title: Text("Independence Day",
                  style: TextStyle(color: Colors.white)),
              subtitle: Text("15 Aug 2025", style: TextStyle(color: Colors.white70)),
            ),
          ),
          Card(
            color: const Color(0xFF211D37),
            child: const ListTile(
              leading: Icon(Icons.beach_access, color: Colors.orangeAccent),
              title: Text("Diwali Break",
                  style: TextStyle(color: Colors.white)),
              subtitle: Text("28 Oct 2025 - 02 Nov 2025",
                  style: TextStyle(color: Colors.white70)),
            ),
          ),
        ],
      ),
    );
  }
}
