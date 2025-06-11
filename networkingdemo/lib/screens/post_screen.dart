import 'package:flutter/material.dart';
import 'package:networkingdemo/models/post.dart';
import 'package:networkingdemo/services/post_remote_services.dart';
import 'package:networkingdemo/widgets/post_card.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post>? allPosts;
  bool isLoaded = true;

  @override
  void initState() {
    super.initState();
    // fetchPosts();
    getData();
  }

  void getData() async {
    allPosts = await PostRemoteServices().getAllPosts();
    if (allPosts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemBuilder: (context, index) => PostCard(post: allPosts![index]),
          itemCount: allPosts?.length ?? 0,
        ),
      ),
    );
  }
}
