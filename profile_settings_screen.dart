import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatefulWidget {
  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  String username = "T5 User";
  String mobile = "7708736255";
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile & Settings"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.indigo,
              child: Text(username[0], style: TextStyle(fontSize: 28, color: Colors.white)),
            ),
            SizedBox(height: 16),
            Text("Username", style: TextStyle(fontSize: 16)),
            TextField(
              controller: TextEditingController(text: username),
              onChanged: (val) => setState(() => username = val),
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            Text("Mobile Number", style: TextStyle(fontSize: 16)),
            TextField(
              controller: TextEditingController(text: mobile),
              readOnly: true,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            SwitchListTile(
              value: notificationsEnabled,
              onChanged: (val) => setState(() => notificationsEnabled = val),
              title: Text("Enable Notifications"),
              activeColor: Colors.indigo,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Profile updated!")),
                );
              },
              child: Text("Save Changes"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
