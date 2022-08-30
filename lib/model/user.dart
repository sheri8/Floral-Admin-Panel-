import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;

  const User({
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot['email'],
      uid: snapshot['uid'],
    );
  }
}
