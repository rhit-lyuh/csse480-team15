import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {

  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(30.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Column(
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 40.0
                        ),
                      ),
                      ListTile(
                        title: Text("Username:"),
                      ),
                      ListTile(
                        title: Text("Year: "),
                      ),
                      ListTile(
                        title: Text("Major:"),
                      ),
                      ListTile(
                        title: Text("Minor:"),
                      ),
                      ListTile(
                        title: Text("Academic:"),
                      ),
                    ]    
                  ),
                ),
              ),
            );
  }
}