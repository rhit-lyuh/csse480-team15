import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {

  final String username;
  final String year;
  final String major;
  final String minor;
  final String academic;

  const ProfileCard({
    required this.username,
    required this.year,
    required this.major,
    required this.minor,
    required this.academic,
    super.key
  });

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
                        "Welcome ${username}",
                        style: TextStyle(
                          fontSize: 40.0
                        ),
                      ),
                      ListTile(
                        title: Text("Username: ${username}"),
                      ),
                      ListTile(
                        title: Text("Year: ${year}"),
                      ),
                      ListTile(
                        title: Text("Major: ${major}"),
                      ),
                      ListTile(
                        title: Text("Minor: ${minor}"),
                      ),
                      ListTile(
                        title: Text("Academic: ${academic}"),
                      ),
                    ]    
                  ),
                ),
              ),
            );
  }
}