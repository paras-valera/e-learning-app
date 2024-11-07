import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/course.dart';

// Course Events
abstract class CourseEvent {}
class FetchCourses extends CourseEvent {}

// Course States
abstract class CourseState {}
class CourseLoading extends CourseState {}
class CourseLoaded extends CourseState {
  final List<Course> courses;

  CourseLoaded(this.courses);
}
class CourseError extends CourseState {}

// Course Bloc
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseLoading()) {
    // Registering an event handler for FetchCourses event
    on<FetchCourses>((event, emit) async {
      emit(CourseLoading());
      await Future.delayed(Duration(seconds: 1)); // Simulate loading
      emit(CourseLoaded([
        Course("Flutter Basics", "Learn the basics of Flutter.", "assets/images/image1.webp"),
        Course("Advanced Flutter", "Deep dive into Flutter.", "assets/images/image2.webp"),
        Course("Flutter Basics", "Learn the basics of Flutter.", "assets/images/image1.webp"),
        Course("Advanced Flutter", "Deep dive into Flutter.", "assets/images/image2.webp"),
        Course("Flutter Basics", "Learn the basics of Flutter.", "assets/images/image1.webp"),
        Course("Advanced Flutter", "Deep dive into Flutter.", "assets/images/image2.webp"),
        Course("Flutter Basics", "Learn the basics of Flutter.", "assets/images/image1.webp"),
        Course("Advanced Flutter", "Deep dive into Flutter.", "assets/images/image2.webp"),
        Course("Flutter Basics", "Learn the basics of Flutter.", "assets/images/image1.webp"),
        Course("Advanced Flutter", "Deep dive into Flutter.", "assets/images/image2.webp"),
        Course("Flutter Basics", "Learn the basics of Flutter.", "assets/images/image1.webp"),
        Course("Advanced Flutter", "Deep dive into Flutter.", "assets/images/image2.webp"),
      ]));
    });
  }
}

