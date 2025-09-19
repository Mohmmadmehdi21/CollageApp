import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HostelPage extends StatelessWidget {
  const HostelPage({super.key});

  // ✅ Helper function for card
  Widget _buildInfoCard(
      IconData icon,
      String title,
      String subtitle, {
        Color iconColor = Colors.purpleAccent,
        Widget? trailing,
        VoidCallback? onTap,
      }) {
    return Card(
      color: const Color(0xFF211D37),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: iconColor, size: 30),
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: trailing,
      ),
    );
  }

  // ✅ Function to get location
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Service enabled check
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    // Permission check
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permission denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permissions are permanently denied.");
    }

    // Get current location
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  // ✅ Popup dialog for Location
  void _showLocationDialog(BuildContext context) async {
    try {
      Position pos = await _getCurrentLocation();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF1A1736),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: const Text(
              "Your Location",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Latitude: ${pos.latitude}\nLongitude: ${pos.longitude}",
              style: const TextStyle(color: Colors.white70),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  foregroundColor: Colors.white,
                ),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Error case (no permission / no gps)
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF1A1736),
            title: const Text("Error",
                style: TextStyle(color: Colors.redAccent)),
            content: Text("$e",
                style: const TextStyle(color: Colors.white70)),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  foregroundColor: Colors.white,
                ),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hostel",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Room Info
          _buildInfoCard(Icons.meeting_room, "Room No: B-203",
              "Block: B | Floor: 2"),

          // Hostel Fee
          _buildInfoCard(
            Icons.credit_card,
            "Hostel Fee",
            "₹30,000 / Year",
            trailing: const Text(
              "Paid ✅",
              style: TextStyle(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold),
            ),
          ),

          // Warden Info
          _buildInfoCard(Icons.person, "Warden: Mr. Sharma",
              "Contact: +91 98765 12345"),

          // Mess Facility
          _buildInfoCard(
            Icons.restaurant,
            "Mess Facility",
            "Vegetarian + Non-Vegetarian",
            trailing: const Text(
              "Active",
              style: TextStyle(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold),
            ),
          ),

          // ✅ Location Tracker card (Now functional)
          _buildInfoCard(
            Icons.location_on,
            "Location Tracker",
            "Track your current location",
            iconColor: Colors.redAccent,
            trailing: const Text(
              "Tap to Check",
              style: TextStyle(
                  color: Colors.orangeAccent, fontWeight: FontWeight.bold),
            ),
            onTap: () => _showLocationDialog(context),
          ),
        ],
      ),
    );
  }
}
