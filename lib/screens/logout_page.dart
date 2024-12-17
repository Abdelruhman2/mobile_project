import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logging Out..."),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,  // Change Color OF up bar 
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.exit_to_app,  // Exit Icon 
                size: 80.0,
                color: Colors.blueAccent,
              ),
              SizedBox(height: 24),
              Text(
                "Are you sure you want to log out?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Delete Token or End The Session for this user To Try open another Session 
                  // Go to Sign in Page again 
                  Navigator.pushReplacementNamed(context, '/sign_in');  
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');  // Navigate to Home Screen
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
