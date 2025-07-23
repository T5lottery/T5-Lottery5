import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController upiIdController = TextEditingController();

  void submitWithdrawal() {
    final amount = amountController.text.trim();
    final upiId = upiIdController.text.trim();

    if (amount.isEmpty || double.tryParse(amount) == null || upiId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enter valid amount and UPI ID")),
      );
      return;
    }

    // Simulate withdrawal request
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Withdrawal request of ₹$amount sent to $upiId")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: Text("Withdraw"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Enter Amount", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "₹100",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 16),
            Text("Enter UPI ID", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            TextField(
              controller: upiIdController,
              decoration: InputDecoration(
                hintText: "yourupi@bank",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: submitWithdrawal,
              icon: Icon(Icons.send),
              label: Text("Request Withdrawal"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
