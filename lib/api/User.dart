import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collection = 'users'; // 🔹 테스트용 컬렉션 이름

  // CREATE - 데이터 추가
  Future<void> addUser(String name, int age) async {
    await _db.collection(_collection).add({
      'name': name,
      'age': age,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // READ - 전체 가져오기
  Stream<List<Map<String, dynamic>>> getUsers() {
    return _db
        .collection(_collection)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => {'id': doc.id, ...doc.data()})
              .toList(),
        );
  }

  // UPDATE - 특정 문서 수정
  Future<void> updateUser(String docId, String newName, int newAge) async {
    await _db.collection(_collection).doc(docId).update({
      'name': newName,
      'age': newAge,
    });
  }

  // DELETE - 특정 문서 삭제
  Future<void> deleteUser(String docId) async {
    await _db.collection(_collection).doc(docId).delete();
  }
}
