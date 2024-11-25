import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Layout',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Center')),
      body: Column(
        children: <Widget>[
          userProfileSection(),
          actionIconsSection(),
          expandedOptionsList(),
        ],
      ),
    );
  }

  Widget userProfileSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          profileDetails(),
          const SizedBox(height: 16),
          statsRow(),
        ],
      ),
    );
  }

  Widget profileDetails() {
    return const Row(
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage('https://ibb.co/N65KBNh'),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Salahaldin AbdalNabi', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
            Text('Frontend Developer', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }

  Widget statsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        buildStat('1400', 'Collect'),
        buildStat('76', 'Attention'),
        buildStat('2310', 'Track'),
        buildStat('157', 'Coupons'),
      ],
    );
  }

  Widget buildStat(String number, String label) {
    return Column(
      children: <Widget>[
        Text(number, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget actionIconsSection() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButtonWithLabel(icon: Icons.wallet, label: 'Wallet'),
          IconButtonWithLabel(icon: Icons.local_shipping, label: 'Delivery'),
          IconButtonWithLabel(icon: Icons.monetization_on, label: 'Service'),
          IconButtonWithLabel(icon: Icons.message, label: 'Message', badge: 10),
          
        ],
      ),
    );
  }

  Widget expandedOptionsList() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          buildOptionItem(Icons.location_on, 'Address', 'Ensure your delivery address is up-to-date.'),
          buildOptionItem(Icons.lock, 'Privacy', 'Manage system permissions and privacy settings.'),
          buildOptionItem(Icons.settings, 'General', 'Adjust your basic settings.'),
          buildOptionItem(Icons.notifications, 'Notification', 'Manage your notification preferences.'),
        ],
      ),
    );
  }

  Widget buildOptionItem(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.pink),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class IconButtonWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final int badge;

  const IconButtonWithLabel({
    super.key,
    required this.icon,
    required this.label,
    this.badge = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Icon(icon, size: 30, color: Colors.black87),
            if (badge != 0)
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.red,
                child: Text('$badge', style: const TextStyle(fontSize: 12, color: Colors.white)),
              ),
          ],
        ),
        Text(label),
      ],
    );
  }
}
