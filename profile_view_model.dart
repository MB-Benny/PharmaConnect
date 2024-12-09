

import 'package:flutter/material.dart';
import '../Model/user_data_provider.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserDataProvider userDataProvider;

  ProfileViewModel({required this.userDataProvider});

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isEditing = false;
  bool get isEditing => _isEditing;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController practitionerIdController = TextEditingController();
  final TextEditingController billingAddressController = TextEditingController();

  void toggleEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  Future<void> loadUserData(String userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final userData = await userDataProvider.getUserData(userId);
      nameController.text = userData['name'] ?? '';
      phoneController.text = userData['phone'] ?? '';
      emailController.text = userData['email'] ?? '';
      practitionerIdController.text = userData['practitionerId'] ?? '';
      billingAddressController.text = userData['billingAddress'] ?? '';
    } catch (e) {
      debugPrint('Error loading user data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveUserData() async {
    try {
      await userDataProvider.addUserData(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        practitionerId: practitionerIdController.text,
        billingAddress: billingAddressController.text,
      );
      toggleEditing();
    } catch (e) {
      debugPrint('Error saving user data: $e');
    }
  }
}
