import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDataProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserData({
    required String name,
    required String phone,
    required String email,
    required String practitionerId,
    required String billingAddress,
  }) async {
    try {
      await _firestore.collection('userData').doc('uniqueUserId').set({
        'name': name,
        'phone': phone,
        'email': email,
        'practitionerId': practitionerId,
        'billingAddress': billingAddress,
        'timestamp': FieldValue.serverTimestamp(),
      });
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding user data: $e');
      rethrow;
    }
  }


  Future<Map<String, dynamic>> getUserData(String userId) async {
    try {
      final docSnapshot = await _firestore.collection('userData').doc(userId).get();
      if (docSnapshot.exists) {
        return docSnapshot.data() ?? {};
      } else {
        throw Exception('User data not found');
      }
    } catch (e) {
      debugPrint('Error fetching user data: $e');
      rethrow;
    }
  }
}
