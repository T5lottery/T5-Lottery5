import 'package:flutter/material.dart';

class GameHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> gameHistory = [
    {"game": "1 Min Wingo", "color": "Red", "amount": 10, "result": "Win", "time": "10:30 AM"},
    {"game": "3 Min Wingo", "color": "Green", "amount": 20, "result": "Loss", "time": "10:20 AM"},
    {"game": "5 Min Wingo", "color": "Violet", "amount": 5, "result": "Win", "time": "10:00 AM"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Game History"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: gameHistory.length,
        itemBuilder: (context, index) {
          final history = gameHistory[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.sports_esports, color: Colors.indigo),
              title: Text("${history['game']} - ${history['color']}"),
              subtitle: Text("Time: ${history['time']} | Amount: ₹${history['amount']}"),
              trailing: Text(
                history['result'],
                style: TextStyle(
                  color: history['result'] == 'Win' ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
