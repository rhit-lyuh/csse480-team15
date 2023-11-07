import 'package:flutter/material.dart';

const List<String> yearList 
  = ['Y1', 'Y2', 'Y3', 'Y4', 'Y5', 'Y6', 'Y7'];

const List<String> majorList = 
  [
    'Mechanical engineering',
    'Computer science',
    'Electrical and electronics engineering',
    'Computer engineering',
    'Computer engineering',
    'Chemical engineering',
    'Civil engineering',
    'Computer software engineering',
    'Mathematics',
    'Laser and optical engineering',
    'Physics',
    'Biochemistry',
    'Biology/biological sciences',
    'Molecular biochemistry',
    'Engineering physics/applied physics',
    'Biomathematics, bioinformatics, and computational biology',
    'Computer and information sciences, other',
    'Computational science',
    'Chemistry',
    'Engineering',
    'International/global studies',
    'Economics'
  ];

const List<String> minorList = 
  [
    'Anthropology',
    'Art',
    'Artificial Intelligence',
    'Astronomy',
    'Biochemical Engineering',
    'Biochemistry And Molecular Biology',
    'Biology',
    'Biomathematics',
    'Chemical Engineering',
    'Chemistry',
    'Cognitive Science',
    'Computational Science',
    'Computer Science',
    'Cybersecurity',
    'Data Science',
    'East Asian Studies',
    'Economics',
    'Electrical & Computer Engineering',
    'Entrepreneurial Studies',
    'Environmental Engineering',
    'European Studies',
    'Geography',
    'History',
    'Imaging',
    'Internet Of Things',
    'Language And Literature',
    'Latin American Studies',
    'Manufacturing Engineering',
    'Materials Science And Engineering',
    'Mathematics',
    'Mechanical Engineering',
    'Modern Languages - German',
    'Modern Languages - Japanese',
    'Modern Languages - Spanish',
    'Music',
    'Optical Engineering',
    'Philosophy',
    'Physics',
    'Political Science',
    'Psychology',
    'Religious Studies',
    'Robotics',
    'Six Sigma',
    'Software Engineering',
    'Solid State Physics/ Materials Science',
    'Statistics',
    'Sustainability',
    'Systems Engineering',
    'Theater',
    'Theoretical Physics',
    'Thermal-Fluids'
  ];

  const List<String> academicStandingList = 
  [
    'Good Standing',
    'First Probation',
    'Second Probation',
    'Suspended'
  ];

class ProfileDialog extends StatelessWidget {

  final TextEditingController usernameTextController;
  final TextEditingController yearTextController;
  final TextEditingController majorTextController;
  final TextEditingController minorTextController;
  final TextEditingController academicStandingtextController;
  final void Function() positiveActionCallback;
  final Function(String? value) onYearSelectedCallback;
  final Function(String? value) onMajorSelectedCallback;
  final Function(String? value) onMinorSelectedCallback;
  final Function(String? value) onAcademicSelectedCallback;

  const ProfileDialog({
    required this.usernameTextController,
    required this.yearTextController,
    required this.majorTextController,
    required this.minorTextController,
    required this.academicStandingtextController,
    required this.positiveActionCallback,
    required this.onYearSelectedCallback,
    required this.onMajorSelectedCallback,
    required this.onMinorSelectedCallback,
    required this.onAcademicSelectedCallback,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text("Edit Profile"),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              width: 400,
              child: TextFormField(
                controller: usernameTextController,
                decoration: const InputDecoration(
                  labelText: "Username"
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            DropdownMenu<String>(
              controller: yearTextController,
              width: 400,
              enableFilter: true,
              leadingIcon: const Icon(Icons.search),
              label: const Text('Year'),
              dropdownMenuEntries: yearList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry(
                  value: value, 
                  label: value);
              }).toList(),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              onSelected: onYearSelectedCallback,
            ),
          SizedBox(
              height: 20.0,
            ),
          DropdownMenu<String>(
              width: 400,
              controller: majorTextController,
              enableFilter: true,
              leadingIcon: const Icon(Icons.search),
              label: const Text('Major'),
              dropdownMenuEntries: majorList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry(
                  value: value, 
                  label: value);
              }).toList(),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              onSelected: onMajorSelectedCallback,
          ),
          SizedBox(
              height: 20.0,
            ),
          DropdownMenu<String>(
              width: 400,
              controller: minorTextController,
              enableFilter: true,
              leadingIcon: const Icon(Icons.search),
              label: const Text('Minor'),
              dropdownMenuEntries: minorList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry(
                  value: value, 
                  label: value);
              }).toList(),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              onSelected: onMinorSelectedCallback,
          ),
          SizedBox(
              height: 20.0,
            ),
          DropdownMenu<String>(
              width: 400,
              controller: academicStandingtextController,
              enableFilter: true,
              leadingIcon: const Icon(Icons.search),
              label: const Text('Academic Standing'),
              dropdownMenuEntries: academicStandingList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry(
                  value: value, 
                  label: value);
              }).toList(),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              onSelected: onAcademicSelectedCallback,
          ),
          ]
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            positiveActionCallback();
            Navigator.pop(context);
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}