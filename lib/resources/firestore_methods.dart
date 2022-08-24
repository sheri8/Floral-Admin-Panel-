// import 'dart:ffi';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floral/model/order.dart';
import 'package:floral/resources/storage_method.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
      // res = 'success';
    } catch (e) {
      print(
        e.toString(),
      );
      // res = err.toString();
    }
    // return res;
  }

  Future<void> deletePost(String postId) async {
    // String res = "Some error occurred";
    try {
      await _firestore.collection('posts').doc(postId).delete();
      // res = 'success';
    } catch (err) {
      print(err.toString());
      // res = err.toString();
    }
    // return res;
  }

  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followId)) {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> saveData({
    required String Name,
    required String Type,
    required String Color,
    required String Description,
    required String Category,
    required String Price,
    Uint8List? image,
  }) async {
    String res = 'Some error occcured';
    var uuid = Uuid().v1();
    try {
      String photUrl =
          await StorageMethods().uploadImageToStorage('Snap', image!, true);
      String postId = const Uuid().v1();

      Order order = Order(
          MName: Name,
          MType: Type,
          MColor: Color,
          MDescription: Description,
          MCategory: Category,
          MPhotoUrl: photUrl,
          MPrice: Price);
      await _firestore.collection('Order').doc(uuid).set(order.toJson());

      res = 'success';
    } on FirebaseAuthException catch (e) {
      res = e.message.toString();
    }
    return res;
  }
}
