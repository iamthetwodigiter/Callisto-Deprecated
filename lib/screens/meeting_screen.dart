import 'dart:math';

import 'package:callisto/resources/jitsi_meet_methods.dart';
import 'package:callisto/widgets/home_meeting_button.dart';
import 'package:flutter/material.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
      '',
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  joinMeeting(BuildContext context) async {
    Navigator.pushNamed(context, '/video-call');
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createMeeting,
              icon: Icons.videocam_rounded,
              text: 'New Meeting',
            ),
            HomeMeetingButton(
              onPressed: () => joinMeeting(context),
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.calendar_today_rounded,
              text: 'Schedule',
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.arrow_upward_rounded,
              text: 'Share Screen',
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/Join Meetings with a click!!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
