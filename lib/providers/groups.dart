import 'package:discord/providers/message_box.dart';
import 'package:flutter/cupertino.dart';
import './sub_channel.dart';

class Group {
  final String imageUrl;
  final int messages;
  final int id;
  final bool top;
  final bool bottom;
  final bool line;
  final String name;
  final int memberCount;
  final List<Map<String, Object>> channels;

  Group({
    this.imageUrl,
    this.messages,
    this.id,
    this.top,
    this.bottom,
    this.line,
    this.name,
    this.memberCount,
    this.channels,
  });
}

class Groups extends ChangeNotifier {
  var currentlySelectedId = 2;

  void setCurId(int id) {
    currentlySelectedId = id;
    notifyListeners();
  }

  final List<Group> groupList = [
    Group(
      id: 0,
      top: true,
    ),
    Group(line: true, id: 1),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEO56Ig79t7Uk7LXei3znHG7uGyjBjjyBibRI7pEs4sNcLNlE_',
      messages: 151,
      id: 2,
      name: 'Gaming',
      memberCount: 20,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(
                name: 'Welcome',
                private: false,
                unreadMessages: 10,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(
                name: 'About Me',
                private: true,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Announcements',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments',
                private: true,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Tips',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments',
                private: true,
                unreadMessages: 10,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Tips',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Tips',
                private: false,
                unreadMessages: 1,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
      ],
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTxgd3cjxg-e35R4kGWuC0Pm4uRVCSSHy3x7dxyqzyWNu-aJU4',
      messages: 100,
      id: 3,
      name: 'Pubg Pubg',
      memberCount: 100,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(
                name: 'Welcome',
                private: false,
                unreadMessages: 10,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(
                name: 'About Me',
                private: true,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Announcements',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Tips',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Tips',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Tips',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
      ],
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHJ4e0jM59uPl5Gc_kD57KIbwCkPAOQUYON03zZIo-ikCg-1fV',
      messages: 0,
      id: 4,
      name: 'Slayers',
      memberCount: 450,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(
                name: 'Welcome',
                private: false,
                unreadMessages: 10,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(
                name: 'About Me',
                private: true,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Announcements',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Tips',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Tips',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Tips',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
      ],
    ),
    Group(
      imageUrl:
          'https://global-uploads.webflow.com/5b0d1c0f502061641c1592c5/5b87f3eb7ae6c8f21b6f8cfd_0_ULiiLorLLRG5pY46.jpg',
      messages: 0,
      id: 5,
      name: 'Killers',
      memberCount: 5,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(
                name: 'Welcome',
                private: false,
                unreadMessages: 10,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(
                name: 'About Me',
                private: true,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Announcements',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Tips',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Tips',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Tips',
                private: false,
                unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
      ],
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEO56Ig79t7Uk7LXei3znHG7uGyjBjjyBibRI7pEs4sNcLNlE_',
      messages: 151,
      id: 6,
      name: 'Enjoyment',
      memberCount: 65,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(name: 'Welcome', private: false, unreadMessages: 10,
        messages: [
        MessageBox(),
        MessageBox(),
        MessageBox(),
        MessageBox(),
        MessageBox(),
        ]),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(name: 'About Me', private: true, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Announcements', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Pubg Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Dota 2 Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
      ],
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTxgd3cjxg-e35R4kGWuC0Pm4uRVCSSHy3x7dxyqzyWNu-aJU4',
      messages: 18,
      id: 7,
      name: 'PUBG',
      memberCount: 90,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(name: 'Welcome', private: false, unreadMessages: 10,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(name: 'About Me', private: true, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Announcements', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Pubg Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Dota 2 Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
      ],
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHJ4e0jM59uPl5Gc_kD57KIbwCkPAOQUYON03zZIo-ikCg-1fV',
      messages: 0,
      id: 8,
      name: 'Dota 2',
      memberCount: 45,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(name: 'Welcome', private: false, unreadMessages: 10,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(name: 'About Me', private: true, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Announcements', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Pubg Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Dota 2 Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
      ],
    ),
    Group(
      imageUrl:
          'https://global-uploads.webflow.com/5b0d1c0f502061641c1592c5/5b87f3eb7ae6c8f21b6f8cfd_0_ULiiLorLLRG5pY46.jpg',
      messages: 0,
      id: 9,
      name: 'FIFA',
      memberCount: 1,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(name: 'Welcome', private: false, unreadMessages: 10,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(name: 'About Me', private: true, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Announcements', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Pubg Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Dota 2 Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
      ],
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEO56Ig79t7Uk7LXei3znHG7uGyjBjjyBibRI7pEs4sNcLNlE_',
      messages: 151,
      id: 10,
      name: 'Cricket',
      memberCount: 45,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(name: 'Welcome', private: false, unreadMessages: 10,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(name: 'About Me', private: true, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Announcements', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Pubg Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Dota 2 Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
      ],
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTxgd3cjxg-e35R4kGWuC0Pm4uRVCSSHy3x7dxyqzyWNu-aJU4',
      messages: 0,
      id: 11,
      name: 'Volleyball',
      memberCount: 45,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(name: 'Welcome', private: false, unreadMessages: 10,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(name: 'About Me', private: true, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Announcements', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Pubg Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Dota 2 Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
      ],
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHJ4e0jM59uPl5Gc_kD57KIbwCkPAOQUYON03zZIo-ikCg-1fV',
      messages: 1,
      id: 12,
      name: 'Basketball',
      memberCount: 45,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(name: 'Welcome', private: false, unreadMessages: 10,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(name: 'About Me', private: true, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Announcements', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Pubg Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Dota 2 Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
      ],
    ),
    Group(
      id: 13,
      imageUrl:
          'https://global-uploads.webflow.com/5b0d1c0f502061641c1592c5/5b87f3eb7ae6c8f21b6f8cfd_0_ULiiLorLLRG5pY46.jpg',
      messages: 56,
      name: 'Gaming',
      memberCount: 45,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(name: 'Welcome', private: false, unreadMessages: 10,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(name: 'About Me', private: true, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Announcements', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Pubg Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments', private: true, unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(name: 'Dota 2 Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Tips', private: false, unreadMessages: 0,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 9,
                messages: [
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                  MessageBox(),
                ]),
          ],
        },
      ],
    ),
    Group(line: true),
    Group(
      id: 14,
      bottom: true,
      memberCount: 45,
      channels: [
        {
          'name': 'Welcome',
          'subChannels': [
            SubChannel(name: 'Welcome', private: false, unreadMessages: 10),
          ],
        },
        {
          'name': 'Important',
          'subChannels': [
            SubChannel(name: 'About Me', private: true, unreadMessages: 0),
            SubChannel(
                name: 'Announcements', private: true, unreadMessages: 100),
          ],
        },
        {
          'name': 'PUBG',
          'subChannels': [
            SubChannel(
                name: 'Pubg Tournaments', private: true, unreadMessages: 100),
            SubChannel(name: 'Pubg Tips', private: false, unreadMessages: 0),
            SubChannel(
                name: 'Pubg Mobile Players',
                private: false,
                unreadMessages: 15),
            SubChannel(
                name: 'Pubg Emulator Players',
                private: false,
                unreadMessages: 9),
          ],
        },
        {
          'name': 'Dota 2',
          'subChannels': [
            SubChannel(
                name: 'Dota 2 Tournaments', private: true, unreadMessages: 100),
            SubChannel(name: 'Dota 2 Tips', private: false, unreadMessages: 0),
            SubChannel(
                name: 'Dota 2 Mobile Players',
                private: false,
                unreadMessages: 15),
            SubChannel(
                name: 'Dota 2 Emulator Players',
                private: false,
                unreadMessages: 9),
          ],
        },
        {
          'name': 'Free Fire',
          'subChannels': [
            SubChannel(
                name: 'Free Fire Tournaments',
                private: true,
                unreadMessages: 100),
            SubChannel(
                name: 'Free Fire Tips', private: false, unreadMessages: 0),
            SubChannel(
                name: 'Free Fire Mobile Players',
                private: false,
                unreadMessages: 15),
            SubChannel(
                name: 'Free Fire Emulator Players',
                private: false,
                unreadMessages: 9),
          ],
        },
      ],
    ),
  ];
}
