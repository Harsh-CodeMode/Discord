import 'package:flutter/material.dart';

class Friends extends ChangeNotifier {
  var currentlySelectedId = 3;

  void setCurId(int id) {
    currentlySelectedId = id;
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
      'first': false
    },
    {
      'id': 2,
      'name': 'Tavleen Kour',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEO56Ig79t7Uk7LXei3znHG7uGyjBjjyBibRI7pEs4sNcLNlE_',
      'messages': 0,
      'first': false
    },
    {
      'id': 3,
      'name': 'Harshdev Singh Rissam Good boy very much',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTxgd3cjxg-e35R4kGWuC0Pm4uRVCSSHy3x7dxyqzyWNu-aJU4',
      'messages': 158,
      'first': false
    },
    {
      'id': 4,
      'name': 'Gogi',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHJ4e0jM59uPl5Gc_kD57KIbwCkPAOQUYON03zZIo-ikCg-1fV',
      'messages': 1,
      'first': false
    },
    {
      'id': 5,
      'name': 'Ishtmeet Singh',
      'imageUrl':
          'https://global-uploads.webflow.com/5b0d1c0f502061641c1592c5/5b87f3eb7ae6c8f21b6f8cfd_0_ULiiLorLLRG5pY46.jpg',
      'messages': 0,
      'first': false
    },
    {
      'id': 6,
      'name': 'Tavleen Kour',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEO56Ig79t7Uk7LXei3znHG7uGyjBjjyBibRI7pEs4sNcLNlE_',
      'messages': 0,
      'first': false
    },
    {
      'id': 7,
      'name': 'Harshdev Singh Rissam',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTxgd3cjxg-e35R4kGWuC0Pm4uRVCSSHy3x7dxyqzyWNu-aJU4',
      'messages': 10,
      'first': false
    },
    {
      'id': 8,
      'name': 'Gogi',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHJ4e0jM59uPl5Gc_kD57KIbwCkPAOQUYON03zZIo-ikCg-1fV',
      'messages': 0,
      'first': false
    },
    {
      'id': 9,
      'name': 'Ishtmeet',
      'imageUrl':
          'https://global-uploads.webflow.com/5b0d1c0f502061641c1592c5/5b87f3eb7ae6c8f21b6f8cfd_0_ULiiLorLLRG5pY46.jpg',
      'messages': 50,
      'first': false
    },
    {
      'id': 10,
      'name': 'Tavleen',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEO56Ig79t7Uk7LXei3znHG7uGyjBjjyBibRI7pEs4sNcLNlE_',
      'messages': 158,
      'first': false
    },
    {
      'id': 11,
      'name': 'Harsh',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTxgd3cjxg-e35R4kGWuC0Pm4uRVCSSHy3x7dxyqzyWNu-aJU4',
      'messages': 0,
      'first': false
    },
    {
      'id': 12,
      'name': 'Gogi',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHJ4e0jM59uPl5Gc_kD57KIbwCkPAOQUYON03zZIo-ikCg-1fV',
      'messages': 1,
      'first': false
    },
  ];
}
