import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _notificationCount = 3;
  final List<Color> backgroundColors = [
    Color(0xFFFFE9E9), // Row 1, Image 1
    Color(0xFFFFF3D0), // Row 1, Image 2
    Color(0xFFD9F6FF), // Row 2, Image 1
    Color(0xFFDAF7DF), // Row 2, Image 2
    Color(0xFFFFE9E9), // Row 3, Image 1
    Color(0xFFFFF3D0), // Row 3, Image 2
    Color(0xFFD9F6FF), // Row 4, Image 1
    Color(0xFFDAF7DF), // Row 4, Image 2
  ];


  final List<String> imagePaths = [
    'assets/Images/G1.png', // Image 1
    'assets/Images/G2.png', // Image 2
    'assets/Images/G3.png', // Image 3
    'assets/Images/G4.png', // Image 4
  ];

  final List<String> imageTexts = [
    "Revital Cal 500mg Strip Of 15 Tablets", // Row 1, Image 1
    "Recombigen Dr. ORG New 3 In 1 Vaporizer", // Row 1, Image 2
    "Dr. Morepen Blood Pressure Monitor Model Bp 14", // Row 2, Image 1
    "Revital Cal 500mg Strip Of 15 Tablets", // Row 2, Image 2
    "Revital Cal 500mg Strip Of 15 Tablets", // Row 3, Image 1
    "Recombigen Dr. ORG New 3 In 1 Vaporizer", // Row 3, Image 2
    "Dr. Morepen Blood Pressure Monitor Model Bp 14", // Row 4, Image 1
    "Revital Cal 500mg Strip Of 15 Tablets", // Row 4, Image 2
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize = screenWidth * 0.4;
    double fontSize = screenWidth * 0.05;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3AADA9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        elevation: 0,
        title: const Text(
          'PharmaConnect',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
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
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Use screen width for padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    height: screenHeight * 0.02, // Adjust height based on screen height
                  ),
                  // First Image
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/Images/H1.png', // Replace with the correct asset path
                        height: screenHeight * 0.2, // Adjust image height
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Second Image
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/Images/H2.png', // Replace with the correct asset path
                        height: screenHeight * 0.2, // Adjust image height
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/Images/slider.png',
                width: screenWidth * 0.08,
                height: screenHeight * 0.05,
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sample Drugs",
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "List of Drugs assigned to you",
                    style: TextStyle(
                      fontSize: fontSize * 0.75,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(screenWidth * 0.02),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 600 ? 3 : 2, // 3 images on wider screens
                  crossAxisSpacing: screenWidth * 0.04,
                  mainAxisSpacing: screenHeight * 0.02, // Adjust vertical spacing
                  childAspectRatio: 1.0,
                ),
                itemCount: backgroundColors.length,
                itemBuilder: (context, index) {
                  // Select the image path cyclically
                  String imagePath = imagePaths[index % imagePaths.length];
                  String text = imageTexts[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Container(
                        height: screenHeight * 0.15, // Adjust height for image container
                        decoration: BoxDecoration(
                          color: backgroundColors[index],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01), // Space between image and text
                      Flexible(
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: fontSize * 0.75,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
