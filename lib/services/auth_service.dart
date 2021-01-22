import 'package:assignment_project/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';



class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  Stream<UserID> get loginStream {
    return _auth.authStateChanges().map((User data) {
      if (data != null) {
        return UserID(uid: data.uid);
      } else {
        return null;
      }
    });
  }

  signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password)
      .then((UserCredential user) {
        print("[FirebaseAuth] Logging in process completed");
      });
    } catch (e) {
      print("[FirebaseAuth] Error during logging");
    }
  }

  signOut() async {
    try {
      await _auth.signOut().then((_) {
        print("[FirebaseAuth] Succesful sign out");
      });  
    } catch (e) {
      print("[FirebaseAuth] Error during logging out $e");
    }
  }

  Future<bool> signUp(String email, String password, UserDetail data) async {
      try {
        return await _auth.createUserWithEmailAndPassword(email: email, password: password).then((uid) async {
          return await _database.collection('User').doc(uid.user.uid).set(data.toMap()).then((value) {
            print('[Firestore] User Registered');
            return true;
          });
        });
      } catch (e) {
        print("[FirebaseAuth] Failed Sign Up : ${e.toString()}");
        return false;
      }
  }


usernamefx(String email, String uid) async {
  try {

    Query q = FirebaseFirestore.instance.collection("User").where('email', isEqualTo: email);

    q.get().then((value) async{
      if(value.docs.isEmpty){
        print('email not existed');
        await _database.collection('User').doc(uid).set({
          'email': email,
          'address' : "",
          'isMale' : true,
          'phone' : "",
          'postDoc' : null,
          'username' : email,
          'wishlist' : null,
        });

        //subscribe to notifier

      } else {
        print('email existed already');
        //subscribe to notifier
      }
    } 
    );
      
  } catch (e) {
    print("[FirebaseAuth] Error usernamefx $e");
  }
}


}



