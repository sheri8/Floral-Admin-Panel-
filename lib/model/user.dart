import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  // final String photoUrl;
  // final String username;
  // final String bio;
  // final folllowers;
  // final following;

  const User({
    required this.email,
    required this.uid,
    // required this.photoUrl,
    // required this.username,
    // required this.bio,
    // required this.folllowers,
    // required this.following,
  });

  Map<String, dynamic> toJson() => {
        // "username": username,
        "uid": uid,
        "email": email,
        // "photoUrl": photoUrl,
        // "bio": bio,
        // "followers": folllowers,
        // "following": following,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot['email'],
      uid: snapshot['uid'],
      // photoUrl: snapshot['photoUrl'],
      // username: snapshot['username'],
      // bio: snapshot['bio'],
      // folllowers: snapshot['folllowers'],
      // following: snapshot['following']
    );
  }
}
