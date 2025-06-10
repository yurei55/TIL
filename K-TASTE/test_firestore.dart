import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> testWriteData() async {
    await _db.collection('test').add({
      'message': 'Firestore 연결 성공!',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
