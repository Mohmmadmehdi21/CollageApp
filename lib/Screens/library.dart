import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D3A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Page Heading
              const Text(
                "LIBRARY & BOOKS",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 20),

              // 🔹 Books Management Section (Card instead of Container)
              Card(
                color: const Color(0xFF10103F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "BOOKS MANAGMENT",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Book Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Issued Book:\nProgramming C",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Issue Date: Mon Sep 01 2025",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  "Return Date: Mon Sep 08 2025",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "Fine: Rs. 40",
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),

                          // Pay Now Button (styled ElevatedButton)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purpleAccent,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PaymentPage()),
                              );
                            },
                            child: const Text(
                              "Pay Now",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Library Management Section (Card)
              Card(
                color: const Color(0xFF10103F),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "LIBRARY MANAGMENT",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          // Available Seats Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Available Seats",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "15 seats available",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.green),
                                ),
                              ],
                            ),
                          ),

                          // View All Button -> styled ElevatedButton
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 26, vertical: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const SeatAvailabilityPage()),
                              );
                            },
                            child: const Text(
                              "View All",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Seats Available Section (heading)
              const Text(
                "Seats Available",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              // Two cards side by side; use Expanded + Padding (no fixed width)
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        color: const Color(0xFF10103F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: const [
                              Text(
                                "Available",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Seat Count : 20",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        color: const Color(0xFF10103F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: const [
                              Text(
                                "Occupied",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Seat Count : 10",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 Seat Availability Page (Grid View)
class SeatAvailabilityPage extends StatelessWidget {
  const SeatAvailabilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<bool> seats = List.generate(50, (index) => true);
    List<int> occupiedSeats = [6, 15, 19, 23, 30, 31, 38, 40, 48];
    for (var seat in occupiedSeats) {
      seats[seat - 1] = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Seat Availability"),
        backgroundColor: const Color(0xFF1A1A2E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 50,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.2,
          ),
          itemBuilder: (context, index) {
            bool available = seats[index];
            return Card(
              color: available ? Colors.green : Colors.red,
              shape: RoundedRectangleBorder(
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
      ),
    );
  }
}

// 🔹 Payment Page
class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    String fineAmount = "40";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: const Color(0xFF1A1A2E),
      ),
      backgroundColor: const Color(0xFF0D0D1A),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Payment Details",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),

            const Text("Issued Book: Programming C",
                style: TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            Text("Fine Amount: Rs. $fineAmount",
                style: const TextStyle(color: Colors.redAccent)),
            const SizedBox(height: 20),

            const Text(
              "Choose Payment Method",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 12),

            // Payment Options
            ListTile(
              leading: const Icon(Icons.qr_code, color: Colors.green),
              title: const Text("UPI Payment",
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: const Color(0xFF1A1A2E),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      title: const Text(
                        "Scan & Pay",
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "android/assets/qr.jpg", // change if your asset path differs
                            width: 200,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Scan this QR to complete payment",
                            style:
                            TextStyle(color: Colors.white70, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Close",
                              style: TextStyle(color: Colors.purpleAccent)),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.credit_card, color: Colors.blue),
              title: const Text("Credit/Debit Card",
                  style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_balance, color: Colors.orange),
              title: const Text("Net Banking",
                  style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),

            const Spacer(),

            // Pay Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Payment Successful ✅",
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.green),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  "Pay Rs. 40",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
