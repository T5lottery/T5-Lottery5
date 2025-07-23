import 'package:flutter/material.dart';

class WingoGameScreen extends StatefulWidget {
  final String gameType; // e.g., "1 Min", "3 Min", "5 Min"

  WingoGameScreen({required this.gameType});

  @override
  _WingoGameScreenState createState() => _WingoGameScreenState();
}

class _WingoGameScreenState extends State<WingoGameScreen> {
  String selectedColor = "";
  int selectedAmount = 1;

  List<String> colors = ["Green", "Red", "Violet"];
  List<int> amounts = [1, 5, 10, 20, 50, 100];

  void placeBet() {
    if (selectedColor.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Bet placed: ₹$selectedAmount on $selectedColor")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a color to place your bet")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: Text("${widget.gameType} Wingo Game"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Choose a color and amount to place your bet:",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Wrap(
              spacing: 12,
              children: colors.map((color) {
                return ChoiceChip(
                  label: Text(color),
                  selected: selectedColor == color,
                  selectedColor: Colors.deepPurple,
                  onSelected: (_) => setState(() => selectedColor = color),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text("Select Bet Amount", style: TextStyle(fontSize: 16)),
            Wrap(
              spacing: 12,
              children: amounts.map((amount) {
                return ChoiceChip(
                  label: Text("₹$amount"),
                  selected: selectedAmount == amount,
                  selectedColor: Colors.deepPurpleAccent,
                  onSelected: (_) => setState(() => selectedAmount = amount),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: placeBet,
              child: Text("Place Bet"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
