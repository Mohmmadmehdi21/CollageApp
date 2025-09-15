import 'package:flutter/material.dart';

class StudentLeavePage extends StatefulWidget {
  const StudentLeavePage({super.key});

  @override
  State<StudentLeavePage> createState() => _StudentLeavePageState();
}

class _StudentLeavePageState extends State<StudentLeavePage> {
  final TextEditingController _reasonController = TextEditingController();
  DateTime? _fromDate;
  DateTime? _toDate;

  // Date Picker Function
  Future<void> _pickDate(BuildContext context, bool isFromDate) async {
    DateTime initialDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  // Submit Function
  void _submitLeave() {
    if (_reasonController.text.isEmpty || _fromDate == null || _toDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields before submitting."),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            "Leave applied from ${_fromDate!.toLocal()} to ${_toDate!.toLocal()}"),
        backgroundColor: Colors.green,
      ),
    );

    // Reset fields
    _reasonController.clear();
    setState(() {
      _fromDate = null;
      _toDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Student Leave Application",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Reason Input
          TextField(
            controller: _reasonController,
            maxLines: 3,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter reason for leave...",
              hintStyle: const TextStyle(color: Colors.white54),
              filled: true,
              fillColor: const Color(0xFF211D37),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Date Pickers
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _pickDate(context, true),
                  icon: const Icon(Icons.date_range),
                  label: Text(
                    _fromDate == null
                        ? "From Date"
                        : "From: ${_fromDate!.day}-${_fromDate!.month}-${_fromDate!.year}",
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _pickDate(context, false),
                  icon: const Icon(Icons.date_range),
                  label: Text(
                    _toDate == null
                        ? "To Date"
                        : "To: ${_toDate!.day}-${_toDate!.month}-${_toDate!.year}",
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Submit Button
          Center(
            child: ElevatedButton.icon(
              onPressed: _submitLeave,
              icon: const Icon(Icons.send),
              label: const Text("Submit Leave Request"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
