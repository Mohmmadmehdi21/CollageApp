import 'package:flutter/material.dart';
import 'package:project/Screens/Qr.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Payments",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Pending Fees Card
          Card(
            color: const Color(0xFF211D37),
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.account_balance_wallet,
                color: Colors.purpleAccent,
              ),
              title: const Text(
                "Pending Fees",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                "₹30 due",
                style: TextStyle(color: Colors.redAccent),
              ),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Qr()));
                },
                child: const Text("Pay Now"),
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "Payment Methods",
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          const SizedBox(height: 12),

          // Payment Options
          Row(
            children: [
              Expanded(
                child: Card(
                  color: const Color(0xFF211D37),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      // TODO: UPI Payment
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: const [
                          Icon(Icons.qr_code,
                              color: Colors.purpleAccent, size: 40),
                          SizedBox(height: 10),
                          Text("UPI", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: const Color(0xFF211D37),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      // TODO: Card Payment
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: const [
                          Icon(Icons.credit_card,
                              color: Colors.purpleAccent, size: 40),
                          SizedBox(height: 10),
                          Text("Card", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          const Text(
            "Past Transactions",
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          const SizedBox(height: 12),

          Card(
            color: const Color(0xFF211D37),
            child: ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.green),
              title: const Text("Tuition Fees",
                  style: TextStyle(color: Colors.white)),
              subtitle: const Text("Paid on 10 Sept 2025",
                  style: TextStyle(color: Colors.white70)),
              trailing: const Text("₹20,000",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          Card(
            color: const Color(0xFF211D37),
            child: ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.green),
              title: const Text("Hostel Fees",
                  style: TextStyle(color: Colors.white)),
              subtitle: const Text("Paid on 5 Aug 2025",
                  style: TextStyle(color: Colors.white70)),
              trailing: const Text("₹5,000",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
