import 'package:flutter/material.dart';

import '../models/course.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  CourseDetailScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
          Image.asset('assets/images/image1.webp'),
          SizedBox(height: 16),
            Text(course.description, style: TextStyle(fontSize: 18)),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Mock progress
              },
              child: Text("Start Course"),
            ),
          ],
        ),
      ),
    );
  }
}
