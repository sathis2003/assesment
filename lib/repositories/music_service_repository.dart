import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/music_service.dart';

class MusicServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MusicService>> getMusicServices() async {
    try {
      final QuerySnapshot snapshot =
          await _firestore.collection('music_services').get();
      return snapshot.docs.map((doc) {
        return MusicService.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    } catch (e) {
      print('Error fetching music services: $e');
      return [];
    }
  }
}
