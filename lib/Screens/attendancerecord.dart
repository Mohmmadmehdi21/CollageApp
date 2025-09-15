import 'package:flutter/material.dart';

class AttendanceRecordPage extends StatelessWidget {
  const AttendanceRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        title: const Text("SLISS Portal - Attendance"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Student Info
            Card(
              color: const Color(0xFF1A1A2E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    Text("Student Information",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    _infoRow("Name", "Mohd Azam Khan"),
                    _infoRow("Branch", "CSE"),
                    _infoRow("Semester", "3"),
                    _infoRow("Admission No", "240290010XXXX"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Attendance Overview
            Card(
              color: const Color(0xFF1A1A2E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text("Attendance Overview",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: 0.81,
                      minHeight: 14,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.purpleAccent),
                    ),
                    const SizedBox(height: 12),
                    const Text("81.18%", style: TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(height: 6),
                    const Text(
                      "You need to attend 22 lectures (~3 days) to reach 85% attendance.",
                      style: TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Example Subject Card
            _buildSubjectCard("BCS303", "Discrete Structures", "Preeti Singh", 18, 2, 0.90, Colors.green),
            _buildSubjectCard("BCS302", "Computer Organisation", "Laxman Singh", 13, 7, 0.65, Colors.red),

            const SizedBox(height: 20),
            // Today's Attendance Example
            _buildTodayCard("BCS303", "Discrete Structures", true),
            _buildTodayCard("BCS302", "Computer Organisation", false),
          ],
        ),
      ),
    );
  }

  // Subject Card
  static Widget _buildSubjectCard(String code, String subject, String faculty,
      int present, int absent, double percent, Color color) {
    return Card(
      color: const Color(0xFF211D37),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text("$code - $subject",
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
        subtitle: Text("Faculty: $faculty\nPresent: $present | Absent: $absent",
            style: const TextStyle(color: Colors.white70)),
        trailing: SizedBox(
          width: 50,
          height: 50,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: percent,
                strokeWidth: 5,
                color: color,
                backgroundColor: Colors.grey[700],
              ),
              Text(
                "${(percent * 100).toStringAsFixed(0)}%",
                style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Today's Attendance Card
  static Widget _buildTodayCard(String code, String subject, bool present) {
    return Card(
      color: const Color(0xFF211D37),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text("$code - $subject",
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
        subtitle: Text(
          "Status: ${present ? "Present" : "Absent"}",
          style: TextStyle(color: present ? Colors.green : Colors.red),
        ),
      ),
    );
  }
}

// Reusable Info Row
class _infoRow extends StatelessWidget {
  final String label;
  final String value;

  const _infoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70)),
        Text(value, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
