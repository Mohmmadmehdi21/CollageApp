import 'package:flutter/material.dart';

class TimeTablePage extends StatelessWidget {
  const TimeTablePage({super.key});

  // Helper for period card
  Widget _buildPeriodCard(String subject, String time, String room) {
    return Card(
      color: const Color(0xFF211D37),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.book, color: Colors.purpleAccent, size: 28),
        title: Text(
          subject,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "$time • Room $room",
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  // Helper for day section
  Widget _buildDaySection(String day, List<Map<String, String>> periods) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          day,
          style: const TextStyle(
            color: Colors.purpleAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...periods.map((p) => _buildPeriodCard(p["subject"]!, p["time"]!, p["room"]!)),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Time Table",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Monday
          _buildDaySection("Monday", [
            {"subject": "Mathematics", "time": "9:00 - 10:00 AM", "room": "101"},
            {"subject": "Physics", "time": "10:00 - 11:00 AM", "room": "102"},
            {"subject": "Computer Science", "time": "11:15 - 12:15 PM", "room": "Lab-1"},
          ]),

          // Tuesday
          _buildDaySection("Tuesday", [
            {"subject": "Chemistry", "time": "9:00 - 10:00 AM", "room": "103"},
            {"subject": "Mathematics", "time": "10:00 - 11:00 AM", "room": "101"},
            {"subject": "English", "time": "11:15 - 12:15 PM", "room": "104"},
          ]),

          // Wednesday
          _buildDaySection("Wednesday", [
            {"subject": "Computer Science", "time": "9:00 - 10:00 AM", "room": "Lab-2"},
            {"subject": "Physics", "time": "10:00 - 11:00 AM", "room": "102"},
            {"subject": "Mathematics", "time": "11:15 - 12:15 PM", "room": "101"},
          ]),

          // Thursday
          _buildDaySection("Thursday", [
            {"subject": "Chemistry", "time": "9:00 - 10:00 AM", "room": "103"},
            {"subject": "Computer Science", "time": "10:00 - 11:00 AM", "room": "Lab-3"},
            {"subject": "English", "time": "11:15 - 12:15 PM", "room": "104"},
          ]),

          // Friday
          _buildDaySection("Friday", [
            {"subject": "Physics", "time": "9:00 - 10:00 AM", "room": "102"},
            {"subject": "Mathematics", "time": "10:00 - 11:00 AM", "room": "101"},
            {"subject": "Computer Science", "time": "11:15 - 12:15 PM", "room": "Lab-1"},
          ]),

          // Saturday
          _buildDaySection("Saturday", [
            {"subject": "English", "time": "9:00 - 10:00 AM", "room": "104"},
            {"subject": "Chemistry", "time": "10:00 - 11:00 AM", "room": "103"},
          ]),
        ],
      ),
    );
  }
}
