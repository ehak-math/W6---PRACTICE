import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/course_provider.dart';
import 'course_score_form.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.course});

  final Course course;

  void _addScore(BuildContext context) async {
    CourseScore? newScore = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
    );

    if (newScore != null) {
      Provider.of<CoursesProvider>(context, listen: false)
          .addScore(course, newScore);
    }
  }

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          course.name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => _addScore(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<CoursesProvider>(
        builder: (ctx, courseProvider, _) {
          final updatedCourse = courseProvider.getCourseFor(course);

          if (updatedCourse.scores.isEmpty) {
            return const Center(child: Text('No Scores added yet.'));
          }

          return ListView.builder(
            itemCount: updatedCourse.scores.length,
            itemBuilder: (ctx, index) {
              final score = updatedCourse.scores[index];
              return ListTile(
                title: Text(score.studentName),
                trailing: Text(
                  score.studenScore.toString(),
                  style: TextStyle(
                    color: scoreColor(score.studenScore),
                    fontSize: 15,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
