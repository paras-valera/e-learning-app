import 'package:flutter/material.dart';

import 'course_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("E-Learning App")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => CourseListScreen(),
            ));
          },
          child: Text("View Courses"),
        ),
      ),
    );
  }
}
