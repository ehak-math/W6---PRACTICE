import '../models/course.dart';
import 'courses_reposiyory.dart';

class MockCoursesRepository implements CoursesRepository {
  final List<Course> _courses = [
    Course(name: 'Flutter'),
    Course(name: 'Java'),
    Course(name: 'Dart'),

  ];

  @override
  List<Course> getCourses() => _courses;
  
  @override
  void addScore(Course course, CourseScore courseScore) {
    // Check if the course exists in the _courses collection
    if (_courses.contains(course)) {
      course.addScore(courseScore);
    }
  }

}
