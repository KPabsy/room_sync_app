import 'package:flutter/material.dart';

void main() => runApp(HealthDashboardApp());

class HealthDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HealthDashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HealthDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber, // Main background color
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile and search row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/women/1.jpg',
                    ), // Replace with your image
                    radius: 24,
                  ),
                  Icon(Icons.search, color: Colors.white, size: 28),
                ],
              ),
            ),
            // Date and greeting
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Dec 5, 2019',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Text(
                'Hello, Jennifer!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Day selector
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SizedBox(
                height: 48,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: List.generate(7, (index) {
                    final days = ['mo', 'tu', 'we', 'th', 'fr', 'sa', 'su'];
                    final dayNum = (index + 2).toString();
                    final isSelected = index == 3; // Example: Thursday selected
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Column(
                        children: [
                          Text(
                            days[index],
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? Colors.white
                                      : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                dayNum,
                                style: TextStyle(
                                  color:
                                      isSelected
                                          ? Color(0xFF4F5BD5)
                                          : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            // "How are you feeling?" text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                'How are you feeling?',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Cards grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                  children: [
                    _MetricCard(
                      color: Colors.pinkAccent,
                      icon: Icons.favorite,
                      title: 'Heart rate',
                      value: '75 bpm',
                      chart: true,
                    ),
                    _MetricCard(
                      color: Colors.orangeAccent,
                      icon: Icons.bedtime,
                      title: 'Sleep',
                      value: '7 hrs',
                      chart: true,
                    ),
                    _MetricCard(
                      color: Colors.cyanAccent,
                      icon: Icons.local_drink,
                      title: 'Water',
                      value: '7 cups',
                      chart: true,
                    ),
                    _MetricCard(
                      color: Colors.indigoAccent,
                      icon: Icons.directions_walk,
                      title: 'Steps',
                      value: '10,345\n5.23 mi',
                      chart: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String value;
  final bool chart;

  const _MetricCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.value,
    this.chart = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            Spacer(),
            if (chart)
              Container(
                height: 24,
                width: double.infinity,
                // Placeholder for a mini chart/line (use a package for real charts)
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white24,
                ),
              ),
            Spacer(),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(title, style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
