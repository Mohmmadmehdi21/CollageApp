import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for seats
    List<bool> seats = List.generate(50, (index) => true);
    // Example occupied seats
    List<int> occupiedSeats = [6, 15, 19, 23, 30, 31, 38, 40, 48];
    for (var seat in occupiedSeats) {
      seats[seat - 1] = false;
    }

    // Screen width for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate crossAxisCount dynamically
    int crossAxisCount = screenWidth < 400
        ? 3 // small phones
        : screenWidth < 600
        ? 4 // medium phones
        : 6; // tablets

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Library Seat & Book Management",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: const Color(0xFF0D0D1A),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book Info Card
            Card(
              color: const Color(0xFF1A1A2E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("📘 Issued Book: Introduction to Programming",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(height: 8),
                    Text("📅 Issue Date: Mon Sep 01 2025",
                        style: TextStyle(color: Colors.white70)),
                    Text("📅 Return Date: Mon Sep 08 2025",
                        style: TextStyle(color: Colors.white70)),
                    Text("💰 Fine: ₹40",
                        style: TextStyle(color: Colors.redAccent)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Seat Status
            Card(
              color: const Color(0xFF1A1A2E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Seat Status: Green = Available | Red = Occupied\n"
                      "Available Seats: ${seats.where((s) => s).length} | "
                      "Occupied Seats: ${seats.where((s) => !s).length}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text("Current Seat Availability (50 Seats)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            const Text("This shows live seat availability in the library.",
                style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 16),

            // Seats Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount, // Dynamic column count
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.2,
              ),
              itemCount: 50,
              itemBuilder: (context, index) {
                bool available = seats[index];
                return Container(
                  decoration: BoxDecoration(
                    color: available ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Seat ${index + 1}",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
