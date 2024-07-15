import 'package:callisto/resources/auth_methods.dart';
import 'package:callisto/screens/history_meeting_screen.dart';
import 'package:callisto/screens/meeting_screen.dart';
import 'package:callisto/utils/colors.dart';
import 'package:callisto/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    CustomButton(
        text: 'Log Out',
        onPressed: () {
          AuthMethods().signOut();
        })
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        showUnselectedLabels: true,
        // type: BottomNavigationBarType.fixed,
        // unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank_rounded), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock_rounded), label: 'Meetings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
