import 'package:e_squadifi/constants/color_constants.dart';
import 'package:flutter/material.dart';

class Promotion_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Main screen content with gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: ColorConstant.primaryGradiantColor,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                // Top banner with "League of Legends" text overlay
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(30),
                        //   bottomRight: Radius.circular(30),
                        // ),
                        image: DecorationImage(
                          image: AssetImage(
                              'asset/images/wild_pic.png'), // Replace with your asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(16),
                      child: Icon(Icons.notifications, color: Colors.white),
                    ),
                    // Overlay text "League of Legends" at the bottom of the image
                    Positioned(
                      bottom: 8,
                      child: Text(
                        "LEAGUE OF LEGENDS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 1),
                              blurRadius: 8,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Divider below the banner image
                Divider(
                  color: Colors.white.withOpacity(0.5),
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(height: 16),

                // Title and buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildIconButton(Icons.person, "Select Challenger"),
                          _buildIconButton(
                              Icons.card_giftcard, "Set Prize/Token"),
                          _buildIconButton(
                              Icons.calendar_today, "Set Date/Time"),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Pre-register section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pre-register for special offers",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text("See All"),
                            ),
                          ],
                        ),
                        Image.asset('asset/images/Goal.png',
                            height: 60), // Replace with your asset path
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Stats section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatCard("99", "Accepted"),
                      _buildStatCard("500", "Viewers Confirmed"),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Send Challenge button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Center(
                      child: Text(
                        "Send Challenge",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        70), // Space for the central button on the bottom navigation bar
              ],
            ),
          ),
          // Bottom Navigation Bar with a Center Circle Button
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: ColorConstant.primaryGradiantColor,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),
                  SizedBox(width: 50), // Space for the center circle button
                  IconButton(
                    icon: Icon(Icons.people, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          // Central Circular Button on Bottom Navigation Bar
          Positioned(
            bottom: 35, // Adjust as needed to align with the navigation bar
            child: CircleAvatar(
              backgroundImage: AssetImage('asset/images/bottom_bar_logo.jpg'),
              radius: 28,
              backgroundColor: Colors.pinkAccent,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create an icon button with text
  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white.withOpacity(0.2),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Helper method to create a stat card
  Widget _buildStatCard(String value, String label) {
    return Container(
      width: 120,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style:
                TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
