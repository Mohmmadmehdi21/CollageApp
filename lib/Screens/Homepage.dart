import 'package:flutter/material.dart';
import 'payments.dart';            // ✅ Payments page
import 'library.dart';             // ✅ Library page
import 'hostel.dart';              // ✅ Hostel page
import 'academiccalendar.dart';    // ✅ Academic Calendar page
import 'attendancerecord.dart';    // ✅ Attendance Record page
import 'bulletinboard.dart';       // ✅ Bulletin Board page
import 'result.dart';              // ✅ Result page
import 'feedback.dart';            // ✅ Feedback page
import 'mentalhealthsupport.dart'; // ✅ Mental Health Support page
import 'notesandpyqs.dart';        // ✅ Notes & PYQ page
import 'studentleave.dart';        // ✅ Student Leave page
import 'timetable.dart';           // ✅ Time Table page
import 'logout.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selectedPage = "Dashboard"; // default page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1736), // Dark background
      appBar: AppBar(
        backgroundColor: const Color(0xFF221A44),
        title: const Text("SLISS"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mail, color: Colors.white),
            onPressed: () {},
          ),
          const CircleAvatar(
            backgroundColor: Colors.purple,
            child: Text("JD", style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 10),
        ],
      ),

      // Drawer (Scrollable Sidebar)
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: const Color(0xFF221A44),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFF7F45CF)),
                accountName: const Text("Jane Doe"),
                accountEmail: const Text("jane.doe@example.com"),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("JD", style: TextStyle(color: Colors.purple)),
                ),
              ),
              _buildDrawerItem(Icons.dashboard, "Dashboard"),
              _buildDrawerItem(Icons.person, "Profile"),
              _buildDrawerItem(Icons.credit_card, "Payments"),
              _buildDrawerItem(Icons.book, "Library"),
              _buildDrawerItem(Icons.home, "Hostel"),
              _buildDrawerItem(Icons.calendar_today, "Academic Calendar"),
              _buildDrawerItem(Icons.check_circle, "Attendance Record"),
              _buildDrawerItem(Icons.campaign, "Bulletin Board"),
              _buildDrawerItem(Icons.assignment, "Result"),
              _buildDrawerItem(Icons.feedback, "Feedback"),
              _buildDrawerItem(Icons.favorite, "Mental Health Support"),
              _buildDrawerItem(Icons.menu_book, "Notes and PYQ"),
              _buildDrawerItem(Icons.airplane_ticket, "Student Leave"),
              _buildDrawerItem(Icons.schedule, "Time Table"),

              const Divider(color: Colors.white30),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text("Logout", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> LogoutPage()));
                },
              ),
            ],
          ),
        ),
      ),

      // Main Content
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _buildPageContent(),
      ),
    );
  }

  // Drawer item widget
  Widget _buildDrawerItem(IconData icon, String title) {
    bool selected = (selectedPage == title);
    return ListTile(
      leading: Icon(icon,
          color: selected ? Colors.purpleAccent : Colors.white70),
      title: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.purpleAccent : Colors.white,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        setState(() {
          selectedPage = title;
        });
        Navigator.pop(context); // close drawer after selection
      },
    );
  }

  // Switch Pages
  Widget _buildPageContent() {
    if (selectedPage == "Dashboard") {
      return _buildDashboardPage();
    } else if (selectedPage == "Profile") {
      return _buildProfilePage();
    } else if (selectedPage == "Payments") {
      return PaymentsPage();
    } else if (selectedPage == "Library") {
      return LibraryPage();
    } else if (selectedPage == "Hostel") {
      return HostelPage();
    } else if (selectedPage == "Academic Calendar") {
      return AcademicCalendarPage();
    } else if (selectedPage == "Attendance Record") {
      return AttendanceRecordPage();
    } else if (selectedPage == "Bulletin Board") {
      return BulletinBoardPage();
    } else if (selectedPage == "Result") {
      return ResultPage();
    } else if (selectedPage == "Feedback") {
      return FeedbackPage();
    } else if (selectedPage == "Mental Health Support") {
      return MentalHealthSupportPage();
    } else if (selectedPage == "Notes and PYQ") {
      return NotesAndPyqPage();
    } else if (selectedPage == "Student Leave") {
      return StudentLeavePage();
    } else if (selectedPage == "Time Table") {
      return TimeTablePage();
    } else {
      return Center(
        child: Text(
          "$selectedPage Page",
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      );
    }
  }

  // Dashboard Page
  Widget _buildDashboardPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Dashboard",
            style: TextStyle(color: Colors.white, fontSize: 28)),
        const SizedBox(height: 20),
        Row(
          children: [
            _buildDashboardCard("Attendance", "92%", Icons.check_circle),
            _buildDashboardCard("Result", "8.6 CGPA", Icons.assignment),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _buildDashboardCard("Fees Due", "₹15,000", Icons.payment),
            _buildDashboardCard("Notices", "3 New", Icons.campaign),
          ],
        ),
      ],
    );
  }

  Widget _buildDashboardCard(String title, String value, IconData icon) {
    return Expanded(
      child: Card(
        color: const Color(0xFF211D37),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Icon(icon, color: Colors.purpleAccent, size: 36),
              const SizedBox(height: 12),
              Text(title,
                  style: const TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 6),
              Text(value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  // Profile Page
  Widget _buildProfilePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Profile",
            style: TextStyle(color: Colors.white, fontSize: 28)),
        const SizedBox(height: 24),
        Card(
          color: const Color(0xFF211D37),
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildInfoItem("Student ID", "STU10001"),
                    _buildInfoItem("Full Name", "Jane Doe"),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildInfoItem("Email", "jane.doe@example.com"),
                    _buildInfoItem("Phone", "+91 98765 43210"),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildInfoItem("Course", "Computer Science"),
                    _buildInfoItem("Department", "Engineering"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 4),
            Text(value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
