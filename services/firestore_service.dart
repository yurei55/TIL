import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // 테스트용 데이터 쓰기
  Future<void> testWriteData() async {
    try {
      await _db.collection('test').add({
        'message': 'Hello Firestore!',
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('데이터 저장 완료');
    } catch (e) {
      print('저장 실패: $e');
    }
  }

  // 테스트용 데이터 읽기
  Future<void> fetchTestData() async {
    try {
      final snapshot = await _db.collection('test').get();
      for (var doc in snapshot.docs) {
        print('문서 ID: ${doc.id}, 데이터: ${doc.data()}');
      }
    } catch (e) {
      print('데이터 가져오기 실패: $e');
    }
  }
}
