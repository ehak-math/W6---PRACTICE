import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<List<Post>> getPost() async {
    await Future.delayed(Duration(seconds: 5));
    return [
      Post(
        id: 25,
        title: 'Who is the best',
        description: 'teacher ronan',
      ),
      Post(
        id: 26,
        title: 'What is Flutter',
        description: 'A UI toolkit for building natively compiled applications',
      )
    ];
  }
}
