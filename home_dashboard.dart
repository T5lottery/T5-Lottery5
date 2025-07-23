import 'package:flutter/material.dart';

class HomeDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: Text("T5 Lottery"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Welcome to T5 Lottery!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                _dashboardButton("Add Money", Icons.account_balance_wallet, () {
                  // Navigate to Add Money
                }),
                _dashboardButton("Withdraw", Icons.money, () {
                  // Navigate to Withdraw
                }),
                _dashboardButton("Wingo 1 Min", Icons.timer, () {
                  // Navigate to 1 Min Game
                }),
                _dashboardButton("Wingo 5 Min", Icons.av_timer, () {
                  // Navigate to 5 Min Game
                }),
                _dashboardButton("Pilot Game", Icons.flight, () {
                  // Navigate to Pilot
                }),
                _dashboardButton("Game History", Icons.history, () {
                  // Navigate to History
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _dashboardButton(String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple,
        padding: EdgeInsets.all(16),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
