import 'package:flutter/material.dart';

void main() {
  runApp(const MedicationApp());
}

class MedicationApp extends StatelessWidget {
  const MedicationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AlarmsScreen(),
    );
  }
}

class AlarmsScreen extends StatelessWidget {
  const AlarmsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Alarms',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Alarms',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Swipe item left to delete it | press on item to select it.',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'add new alarm',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                AlarmItem(
                  name: 'Vitamins C',
                  count: 22,
                  times: '3 times 08:00 PM - 10:00 PM - 08:00 AM',
                  dateRange: 'from: Jan 1 2021    to: Mar 1 2021',
                  isLocked: true,
                ),
                AlarmItem(
                  name: 'Lipitor',
                  count: 32,
                  times: '2 times 04:00 PM - 10:00 AM',
                  dateRange: 'from: Jan 1 2021    to: Mar 1 2021',
                ),
                AlarmItem(
                  name: 'Singulair',
                  count: 12,
                  times: '3 times 07:00 PM - 09:00 PM - 10:00 AM',
                  dateRange: 'from: Jan 1 2021    to: Mar 1 2021',
                ),
                AlarmItem(
                  name: 'Actos',
                  count: 4,
                  times: '1 time 06:00 PM',
                  dateRange: 'from: Jan 1 2021    to: Mar 1 2021',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: 'Alarms'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: 3,
      ),
    );
  }
}

class AlarmItem extends StatelessWidget {
  final String name;
  final int count;
  final String times;
  final String dateRange;
  final bool isLocked;

  const AlarmItem({
    Key? key,
    required this.name,
    required this.count,
    required this.times,
    required this.dateRange,
    this.isLocked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isLocked ? Colors.grey[200] : Colors.blue[100],
            ),
            child: Icon(
              isLocked ? Icons.lock : Icons.check,
              color: isLocked ? Colors.grey : Colors.blue,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '$count left',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  times,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                Text(
                  dateRange,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
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