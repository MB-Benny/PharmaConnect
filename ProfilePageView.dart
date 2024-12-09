import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/user_data_provider.dart';

class Profilepageview extends StatefulWidget {
  const Profilepageview({Key? key}) : super(key: key);

  @override
  State<Profilepageview> createState() => _ProfilepageviewState();
}

class _ProfilepageviewState extends State<Profilepageview> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _practitionerIdController = TextEditingController();
  final TextEditingController _billingAddressController = TextEditingController();

  bool _isEditing = false;
  bool _isLoading = true;
  int _notificationCount = 3;

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Load user data when the page initializes
  }

  Future<void> _loadUserData() async {
    final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
    final userData = await userDataProvider.getUserData('uniqueUserId'); // Fetch user data from the backend

    setState(() {
      _nameController.text = userData['name'] ?? '';
      _phoneController.text = userData['phone'] ?? '';
      _emailController.text = userData['email'] ?? '';
      _practitionerIdController.text = userData['practitionerId'] ?? '';
      _billingAddressController.text = userData['billingAddress'] ?? '';
      _isLoading = false; // Data loaded
    });
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3AADA9),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/Images/arrow.png',
                  width: screenWidth * 0.07,  // Responsive width
                  height: screenHeight * 0.04, // Responsive height
                ),
              ),
            ),
            const Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _notificationCount = 0; // Clear notifications on tap
                  });
                },
              ),
              if (_notificationCount > 0)
                Positioned(
                  right: 16,
                  top: 13,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 7,
                      minHeight: 7,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: const Color(0xFFF5FEFF),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/Images/avatar.jpg'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _nameController.text.isNotEmpty
                              ? _nameController.text
                              : 'Dr. Rachel Green', // Placeholder
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF475467),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: _toggleEditing,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black),
                            ),
                            child: const Text(
                              'Edit Detail',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildEditableFields(),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableFields() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField('Name', _nameController, screenWidth),
        _buildTextField('Phone', _phoneController, screenWidth),
        _buildTextField('Email', _emailController, screenWidth),
        _buildTextField('Practitioner ID', _practitionerIdController, screenWidth),
        _buildTextField('Billing Address', _billingAddressController, screenWidth),
        if (_isEditing)
          const SizedBox(height: 20),
        if (_isEditing)
          SizedBox(
            width: double.infinity, // Ensures the button takes the full width
            child: ElevatedButton(
              onPressed: () async {
                final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
                await userDataProvider.addUserData(
                  name: _nameController.text,
                  phone: _phoneController.text,
                  email: _emailController.text,
                  practitionerId: _practitionerIdController.text,
                  billingAddress: _billingAddressController.text,
                );
                _toggleEditing(); // Close the edit form
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF10676E),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                elevation: 5,
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF344054),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: !_isEditing,
          decoration: InputDecoration(
            filled: true,
            fillColor: _isEditing ? Colors.white : Colors.grey[200],
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
