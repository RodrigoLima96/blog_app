import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../core/core.dart';
import '../data.dart';

class RemoteBlogDataSourceImpl implements IRemoteBlogDataSource {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  const RemoteBlogDataSourceImpl(
      {required this.firestore, required this.storage});
  @override
  Future<BlogModel> uploadBlog({required BlogModel blog}) async {
    try {
      await firestore.collection('blogs').doc(blog.id).set(blog.toMap());
      return blog;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<String> uploadBlogImage(
      {required Uint8List image, required String blogId}) async {
    try {
      Reference ref = storage.ref().child('blogs').child(blogId);

      UploadTask uploadTask = ref.putData(image);

      TaskSnapshot snap = await uploadTask;

      String imageUrl = await snap.ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getAllBlogs() async {
    try {
      List<BlogModel> blogsList = [];
      final result = await firestore.collection('blogs').get();
      blogsList = result.docs.map((doc) => BlogModel.fromMap(doc.data())).toList();
      return blogsList;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
