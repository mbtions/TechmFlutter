import 'package:flutter/material.dart';
import 'package:networkingdemo/models/photo.dart';
import 'package:networkingdemo/widgets/photo_card.dart';
import 'package:networkingdemo/services/photo_remote_services.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  List<Photo>? allPhotos;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    allPhotos = await PhotoRemoteServices().getAllPhotos();
    if (allPhotos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photos')),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemBuilder: (context, index) => PhotoCard(photo: allPhotos![index]),
          itemCount: allPhotos?.length ?? 0,
        ),
      ),
    );
  }
}
