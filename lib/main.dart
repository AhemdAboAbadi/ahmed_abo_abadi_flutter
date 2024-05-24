import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center'),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
            },
            itemBuilder: (BuildContext context) {
              return {'Option 1', 'Option 2', 'Option 3'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mausam Rayamajhi',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'A trendsetter',
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.edit, color: Colors.white),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildInfoColumn('846', 'Collect'),
                          _buildInfoColumn('51', 'Attention'),
                          _buildInfoColumn('267', 'Track'),
                          _buildInfoColumn('39', 'Coupons'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconColumn(Icons.account_balance_wallet, 'Wallet'),
                  _buildIconColumn(Icons.local_shipping, 'Delivery'),
                  _buildIconColumn(Icons.message, 'Message', badgeCount: 2),
                  _buildIconColumn(Icons.support_agent, 'Service'),
                ],
              ),
              SizedBox(height: 50),
              _buildListTileWithShadow(Icons.location_on, 'Address', 'Ensure your harvesting address'),
              _buildListTileWithShadow(Icons.lock, 'Privacy', 'System permission change'),
              _buildListTileWithShadow(Icons.settings, 'General', 'Basic functional settings'),
              _buildListTileWithShadow(Icons.notifications, 'Notification', 'Take over the news in time'),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildInfoColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Column _buildIconColumn(IconData icon, String label, {int badgeCount = 0}) {
    return Column(
      children: [
        Stack(
          children: [
            Icon(
              icon,
              size: 32,
            ),
            if (badgeCount > 0)
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    '$badgeCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  ListTile _buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 2.0,
              color: Colors.black26,
              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: Icon(Icons.chevron_right),
    );
  }

//   Widget _buildListTileWithShadow(IconData icon, String title, String subtitle) {
//     return Container(
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.white,
//             blurRadius: 10.0,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: _buildListTile(icon, title, subtitle),
//     );
//   }

  Widget _buildListTileWithShadow(IconData icon, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 225, 197, 245),
            blurRadius: 40.0, // Soften the shadow
            spreadRadius: 5.0, // Extend the shadow
            offset: Offset(
              15.0, // Move to right 15 horizontally
              15.0, // Move to bottom 15 vertically
            ),
          )
        ],
        border: Border.all(
          color: Color.fromARGB(255, 203, 205, 243), // Set the border color to green
          width: 2.0, // Set the border width
        ),
        borderRadius: BorderRadius.circular(8), // Optionally add rounded corners
      ),
      child: _buildListTile(icon, title, subtitle),
    );
  }
}

