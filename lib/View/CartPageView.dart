import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPageView extends StatefulWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  State<CartPageView> createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  int _notificationCount = 3;
  int _counter = 1;
  final List<Color> backgroundColors = [
    Color(0xFFFFE9E9), 
    Color(0xFFFFF3D0), 
  ];

  final List<String> imagePaths = [
    'assets/Images/G1.png', // Image 1
    'assets/Images/G2.png', // Image 2
  ];
  final List<String> imageTexts = [
    "Revital Cal 500mg Strip Of 15 Tablets", 
    "Recombigen Dr. ORG New 3 In 1 Vaporizer", 
  ];
  @override
  Widget build(BuildContext context) {
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
                  width: 30,
                  height: 20,// Replace with your image asset path
                  // fit: BoxFit.contain,
                ),
              ),
            ),
            const Text(
              'Dr. Morepen Blood Pressure...',
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
                    _notificationCount = 0; 
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
      body: Stack(
        children : [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  height: 416,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/Images/CardMed.png', 
                              width: 300,
                              height: 280,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Image.asset(
                            'assets/Images/slider.png',
                            width: 30,
                            height: 20,
                            // fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const SizedBox(height:6.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dr. Odin BPCBOA 3H Blood Pressure Machine",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "FREE",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Sample",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 50,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFCDEEF1), // Light gray background
                                    borderRadius: BorderRadius.circular(15), // 1px radius
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Text(
                                      "TRAIL",
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Color(0xFFF10676E),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xFFFCDEEF1),
                          borderRadius: BorderRadius.circular(1), // 1px radius
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Maximum of 12 unit can be added in the cart.",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  color: Colors.white,
                  height: 518,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Product Information",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Dr. Odin BPCBOA 3H Blood Pressure Machine is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            SizedBox(height: 8),
                            const Text(
                              "Uses:",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'It is used for measuring the blood pressure of individuals',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            SizedBox(height: 8),
                            const Text(
                              "Product Features And Specification:",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              '• It has a portable design which makes it easy to carry anywhere at any time',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '• It has an automatic shutdown function which saves power',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '• It can support 2 users at a time with 120 memories each',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '• It helps to measure irregular heartbeat as well',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '• It comes with a large LED display',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '• It has dual power modes i.e., it is chargeable with a USB power source or it can be powered with 4 AA alkaline batteries',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '• It has an average value function that helps to analyse blood pressure variation',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '• It has a one button easy operation',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'View Less',
                                  style: TextStyle(
                                    color: Color(0xFF14818A), // Text color
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFF14818A), // Underline color
                                    decorationStyle: TextDecorationStyle.solid, // Underline style
                                  ),
                                ),
                                Image.asset(
                                  'assets/Images/chevron.png',
                                  width: 30,
                                  height: 20,// Replace with your image asset path
                                  // fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align to the start (left)
                    children: [
                      const Text(
                        "Especially for you",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'List of drugs assigned to you',
                        style: TextStyle(fontSize: 14, color:Color(0xFFF90979C),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 images per row
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 5.0, // Reduced vertical spacing between rows
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
                              height: 120, // Set consistent height for image containers
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
                            const SizedBox(height: 8.0), // Space between image and text
                            Text(
                              text,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis, // Truncate if text is too long
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),


                SizedBox(height: 20), // Space between increment buttons and Place Order button

                // Place Order Button with Forward Arrow

              ],
            ),
          ),
          if (_counter >= 12)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 300, // Adjust width as needed
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 1.5), // Red border color
                  borderRadius: BorderRadius.circular(6), // Rounded corners for the border
                ),
                child: Card(
                  color: Colors.white,
                  elevation: 0, // No shadow for the card
                  margin: EdgeInsets.zero, // Remove margin of the card to eliminate gap
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.error_outline, color: Colors.black),
                        SizedBox(width: 8),
                        Text(
                          "You have reached the maximum limit!",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),



          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,  
              padding: EdgeInsets.zero, // Remove any padding
              margin: EdgeInsets.zero, // Remove any margin
              child: Row(
                children: [
                  // Button 1 - "- 1 +" with custom text color
                  SizedBox(
                    width: 180, // Fixed width for the button
                    child: ElevatedButton(
                      onPressed: null, // Disable the button itself
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // White background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // No rounded corners
                        ),
                        elevation: 5, // Flat button with slight shadow
                        minimumSize: Size(double.infinity, 50), // Set a fixed height for the button
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _counter >= 12 ? Colors.red : Colors.black45, // Border color change
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                if (_counter > 1) {
                                  setState(() {
                                    _counter--; // Decrease counter
                                  });
                                }
                              },
                              child: Text(
                                "-",
                                style: TextStyle(
                                  color: _counter > 1 ? Color(0xFF42464C) : Colors.grey, // Disable button color
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Text(
                              " $_counter ",
                              style: const TextStyle(
                                color: Color(0xFF42464C),
                                fontSize: 18,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_counter < 12) {
                                  setState(() {
                                    _counter++; // Increase counter
                                  });
                                }
                              },
                              child: Text(
                                "+",
                                style: TextStyle(
                                  color: _counter < 12 ? Color(0xFF42464C) : Colors.grey, // Disable button color
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Button 2 - "Place Order" with custom text color
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print("Place Order pressed!");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF10676E), // Background color for Button 2
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Remove rounded corners
                        ),
                        elevation: 5, 
                        minimumSize: Size(double.infinity, 50), 
                      ),
                      child: Text(
                        "Place Order",
                        style: TextStyle(
                          color: Colors.white, // White text color for Button 2
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )








        ]
      ),
    );
  }
}
