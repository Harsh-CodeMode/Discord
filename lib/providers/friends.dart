import 'package:flutter/material.dart';

class Friends extends ChangeNotifier {
  var currentlySelectedId = 3;

  var friendsScreenSelected = 'Everyone';

  void setScreenSelected(String tag) {
    friendsScreenSelected = tag;
    notifyListeners();
  }

  void setCurId(int id) {
    currentlySelectedId = id;
    notifyListeners();
  }

  Icon returnStatusIcon(String status, double dimension) {
    if (status == 'Online') {
      return Icon(
        Icons.brightness_1,
        color: Colors.green,
        size: dimension,
      );
    } else if (status == 'Idle') {
      return Icon(
        Icons.brightness_2,
        color: Colors.yellow,
        size: dimension,
      );
    } else if (status == 'Do Not Disturb') {
      return Icon(
        Icons.remove_circle,
        color: Colors.red,
        size: dimension,
      );
    } else if (status == 'Invisible') {
      return Icon(
        Icons.adjust,
        color: Colors.grey,
        size: dimension,
      );
    } else if (status == 'Offline') {
      return Icon(
        Icons.brightness_1,
        color: Colors.white,
        size: dimension,
      );
    }
    notifyListeners();
  }

  final List<Map<String, dynamic>> friendList = [
    {
      'id': 0,
      'name': 'Friends',
      'first': true,
      'messages': null,
      'imageUrl': null,
    },
    {
      'id': 1,
      'name': 'Ishtmeet Singh',
      'imageUrl':
          'https://global-uploads.webflow.com/5b0d1c0f502061641c1592c5/5b87f3eb7ae6c8f21b6f8cfd_0_ULiiLorLLRG5pY46.jpg',
      'messages': 50,
      'first': false,
      'status': 'Online',
    },
    {
      'id': 2,
      'name': 'Tavleen Kour',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEO56Ig79t7Uk7LXei3znHG7uGyjBjjyBibRI7pEs4sNcLNlE_',
      'messages': 0,
      'first': false,
      'status': 'Do Not Disturb',
    },
    {
      'id': 3,
      'name': 'Harshdev Singh Rissam Good boy very much',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTxgd3cjxg-e35R4kGWuC0Pm4uRVCSSHy3x7dxyqzyWNu-aJU4',
      'messages': 158,
      'first': false,
      'status': 'Invisible',
    },
    {
      'id': 4,
      'name': 'Gogi',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHJ4e0jM59uPl5Gc_kD57KIbwCkPAOQUYON03zZIo-ikCg-1fV',
      'messages': 1,
      'first': false,
      'status': 'Idle',
    },
    {
      'id': 5,
      'name': 'Ishtmeet Singh',
      'imageUrl':
          'https://global-uploads.webflow.com/5b0d1c0f502061641c1592c5/5b87f3eb7ae6c8f21b6f8cfd_0_ULiiLorLLRG5pY46.jpg',
      'messages': 0,
      'first': false,
      'status': 'Offline',
    },
    {
      'id': 6,
      'name': 'Tavleen Kour',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEO56Ig79t7Uk7LXei3znHG7uGyjBjjyBibRI7pEs4sNcLNlE_',
      'messages': 0,
      'first': false,
      'status': 'Idle',
    },
    {
      'id': 7,
      'name': 'Harshdev Singh Rissam',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTxgd3cjxg-e35R4kGWuC0Pm4uRVCSSHy3x7dxyqzyWNu-aJU4',
      'messages': 10,
      'first': false,
      'status': 'Online',
    },
    {
      'id': 8,
      'name': 'Gogi',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHJ4e0jM59uPl5Gc_kD57KIbwCkPAOQUYON03zZIo-ikCg-1fV',
      'messages': 0,
      'first': false,
      'status': 'Offline',
    },
    {
      'id': 9,
      'name': 'Ishtmeet',
      'imageUrl':
          'https://global-uploads.webflow.com/5b0d1c0f502061641c1592c5/5b87f3eb7ae6c8f21b6f8cfd_0_ULiiLorLLRG5pY46.jpg',
      'messages': 50,
      'first': false,
      'status': 'Online',
    },
    {
      'id': 10,
      'name': 'Tavleen',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEO56Ig79t7Uk7LXei3znHG7uGyjBjjyBibRI7pEs4sNcLNlE_',
      'messages': 158,
      'first': false,
      'status': 'Offline',
    },
    {
      'id': 11,
      'name': 'Harsh',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTxgd3cjxg-e35R4kGWuC0Pm4uRVCSSHy3x7dxyqzyWNu-aJU4',
      'messages': 0,
      'first': false,
      'status': 'Idle',
    },
    {
      'id': 12,
      'name': 'Gogi',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHJ4e0jM59uPl5Gc_kD57KIbwCkPAOQUYON03zZIo-ikCg-1fV',
      'messages': 1,
      'first': false,
      'status': 'Online',
    },
  ];
}
