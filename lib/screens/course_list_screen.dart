import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/course_bloc.dart';
import 'course_detail_screen.dart';

class CourseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CourseBloc()..add(FetchCourses()),
      child: Scaffold(
        appBar: AppBar(title: Text("Courses")),
        body: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is CourseLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CourseLoaded) {
              return ListView.separated(
                itemCount: state.courses.length,
                itemBuilder: (context, index) {
                  final course = state.courses[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseDetailScreen(course: course),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50, // Fixed width for the image
                          height: 50, // Fixed height for the image
                          child: Image.asset(course.image, fit: BoxFit.cover),
                        ),
                        SizedBox(width: 16), // Space between the image and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(course.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(course.description, style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();  // Adds a separator (Divider) between list items
                },
              )
              ;

            }
            return Center(child: Text("Failed to load courses."));
          },
        ),
      ),
    );
  }
}
