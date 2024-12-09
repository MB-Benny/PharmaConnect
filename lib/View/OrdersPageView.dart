import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orderspageview extends StatefulWidget {
  const Orderspageview({Key? key}) : super(key: key);

  @override
  State<Orderspageview> createState() => _OrderspageviewState();
}

class _OrderspageviewState extends State<Orderspageview> {
  int _notificationCount = 3;
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
                  height: 20,
                  // fit: BoxFit.contain,
                ),
              ),
            ),
            const Text(
              'My Orders',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildOrderCard(
              orderNumber: "Order:#123456",
              statusText1: "Delivered on 21 Apr, 24",
              statusText2: "+5 items",
              showTrackOrder: false,
            ),
            const SizedBox(height: 16),
            buildOrderCard(
              orderNumber: "Order:#123456",
              statusText1: "In transit on 21 Apr, 24",
              statusText2: "+5 items",
              showTrackOrder: true,
            ),
          ],
        ),
      ),


    );
  }
  Widget buildOrderCard({
    required String orderNumber,
    required String statusText1,
    required String statusText2,
    required bool showTrackOrder, // Control "Track Order" visibility
  }) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      child: Column(
        children: [
          // Top row with order number and arrow image
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(orderNumber, style: TextStyle(fontWeight: FontWeight.bold)),
                Image.asset(
                  'assets/Images/arrowleft.png',
                  width: 35,
                  height: 20, // Replace with your image asset path
                ),
              ],
            ),
          ),
          // Divider that spans full width of the card
          Divider(thickness: 0.8, height: 16),
          // Main content row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with background container
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF3D0), // Light yellow background
                    borderRadius: BorderRadius.circular(8), // Curved edges
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/Images/G4.png',
                      width: 38,
                      height: 38, // Adjust size to fit within the container
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Texts and Track Order
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (statusText1.isNotEmpty)
                        RichText(
                          text: TextSpan(
                            text: statusText1.contains("Delivered")
                                ? "Delivered"
                                : "In transit",
                            style: TextStyle(
                              color: statusText1.contains("Delivered")
                                  ? Colors.green
                                  : Colors.black,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: statusText1.contains(" on")
                                    ? statusText1.substring(statusText1.indexOf(" on"))
                                    : '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // if (statusText2.isNotEmpty)
                          //   Text(
                          //     statusText2,
                          //     style: TextStyle(color: Colors.black, fontSize: 14),
                          //   ),
                          // if (statusText2.contains("+"))
                          //   const SizedBox(width: 8),
                          if (statusText2.contains("+"))
                            Container(
                              width: 50,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAF6F6), // Light gray background
                                borderRadius: BorderRadius.circular(1), // 1px radius
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  "+5 items",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          if (showTrackOrder)
                            const Spacer(),
                          if (showTrackOrder)
                            Text(
                              'Track Order',
                              style: TextStyle(
                                color: Color(0xFF14818A), // Text color
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFF14818A), // Underline color
                                decorationStyle: TextDecorationStyle.solid, // Underline style
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}

