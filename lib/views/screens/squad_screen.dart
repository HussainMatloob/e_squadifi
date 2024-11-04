import 'package:e_squadifi/constants/color_constants.dart';
import 'package:flutter/material.dart';

class SquadsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Main screen content
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
                // Header with icons and avatars
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back, color: Colors.white),
                      Text(
                        "Squads",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.notifications, color: Colors.white),
                    ],
                  ),
                ),
                // Horizontal list for players
                Container(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("asset/images/image_3.jpg"),
                              radius: 25,
                              backgroundColor: Colors.grey[800],
                            ),
                            SizedBox(height: 4),
                            Text("Player Name",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Discover People / My Squads Tabs
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Discover People",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: 16),
                      Text("My Squads",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 16)),
                    ],
                  ),
                ),
                // List of squads
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    "asset/images/image_3.jpg"), // Replace with actual image path
                                radius: 25,
                                backgroundColor: Colors.grey[800],
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Wade Warren",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Skill Level | Preferred Role",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                              // Add game mode tags
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildTag("Action"),
                                  SizedBox(width: 4),
                                  _buildTag("Shooter"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                    height:
                        70), // Space to accommodate the circular button on the bottom navigation bar
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
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(30),
                //   topRight: Radius.circular(30),
                // ),
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
            bottom: 50, // Adjust as needed to align with the navigation bar
            child: CircleAvatar(
              backgroundImage: AssetImage("asset/images/bottom_bar_logo.jpg"),
              radius: 28,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create a tag
  Widget _buildTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}
