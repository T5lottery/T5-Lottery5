import 'package:flutter/material.dart';

class AddMoneyScreen extends StatefulWidget {
  @override
  _AddMoneyScreenState createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  final TextEditingController amountController = TextEditingController();

  void proceedToPayment() {
    final amount = amountController.text.trim();
    if (amount.isEmpty || double.tryParse(amount) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid amount")),
      );
      return;
    }

    // Proceed with payment (stub)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Proceeding to pay ₹$amount")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: Text("Add Money"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Enter Amount", style: TextStyle(fontSize: 20)),
            SizedBox(height: 12),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "₹100",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: proceedToPayment,
              icon: Icon(Icons.account_balance_wallet),
              label: Text("Add Money"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 40),
            Divider(),
            SizedBox(height: 20),
            Text("UPI Payment Options", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            _upiInfo("QR Code 1", "luckypay@upi"),
            SizedBox(height: 20),
            _upiInfo("QR Code 2", "t5lottery@postbank"),
          ],
        ),
      ),
    );
  }

  Widget _upiInfo(String label, String upiId) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            children: [
              Icon(Icons.qr_code, size: 30),
              SizedBox(width: 12),
              Text(upiId, style: TextStyle(fontSize: 16)),
            ],
          ),
        )
      ],
    );
  }
}
