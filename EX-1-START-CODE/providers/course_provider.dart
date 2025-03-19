import 'package:flutter/material.dart';

import '../models/course.dart';
import '../repositories/courses_reposiyory.dart';

class CoursesProvider with ChangeNotifier {
  final CoursesRepository repository;

  CoursesProvider({required this.repository});

  List<Course> get courses => repository.getCourses();

  Course getCourseFor(Course name) {
    return courses.firstWhere((course) => course.name == name.name);
  }

  void addScore(Course name, CourseScore score) {
    repository.addScore(name, score);
    notifyListeners();
  }
}
