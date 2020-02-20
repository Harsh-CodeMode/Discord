import 'package:flutter/cupertino.dart';

class Group {
  final String imageUrl;
  final int messages;
  final int id;

  Group({this.imageUrl, this.messages, this.id});
}

class Groups extends ChangeNotifier {
  var currentlySelectedId = 1;

  void setCurId(int id) {
    currentlySelectedId = id;
    notifyListeners();
  }

  final List<Group> groupList = [
    Group(
      imageUrl:
          'https://global-uploads.webflow.com/5b0d1c0f502061641c1592c5/5b87f3eb7ae6c8f21b6f8cfd_0_ULiiLorLLRG5pY46.jpg',
      messages: 56,
      id: 1,
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEO56Ig79t7Uk7LXei3znHG7uGyjBjjyBibRI7pEs4sNcLNlE_',
      messages: 151,
      id: 2,
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTxgd3cjxg-e35R4kGWuC0Pm4uRVCSSHy3x7dxyqzyWNu-aJU4',
      messages: 0,
      id: 3,
    ),
    Group(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHJ4e0jM59uPl5Gc_kD57KIbwCkPAOQUYON03zZIo-ikCg-1fV',
        messages: 0,
        id: 4),
    Group(
      imageUrl:
          'https://global-uploads.webflow.com/5b0d1c0f502061641c1592c5/5b87f3eb7ae6c8f21b6f8cfd_0_ULiiLorLLRG5pY46.jpg',
      messages: 56,
      id: 5,
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEO56Ig79t7Uk7LXei3znHG7uGyjBjjyBibRI7pEs4sNcLNlE_',
      messages: 151,
      id: 6,
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTxgd3cjxg-e35R4kGWuC0Pm4uRVCSSHy3x7dxyqzyWNu-aJU4',
      messages: 0,
      id: 7,
    ),
    Group(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHJ4e0jM59uPl5Gc_kD57KIbwCkPAOQUYON03zZIo-ikCg-1fV',
        messages: 0,
        id: 8),
    Group(
      imageUrl:
          'https://global-uploads.webflow.com/5b0d1c0f502061641c1592c5/5b87f3eb7ae6c8f21b6f8cfd_0_ULiiLorLLRG5pY46.jpg',
      messages: 56,
      id: 9,
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEO56Ig79t7Uk7LXei3znHG7uGyjBjjyBibRI7pEs4sNcLNlE_',
      messages: 151,
      id: 10,
    ),
    Group(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTxgd3cjxg-e35R4kGWuC0Pm4uRVCSSHy3x7dxyqzyWNu-aJU4',
      messages: 11,
      id: 11,
    ),
    Group(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRHJ4e0jM59uPl5Gc_kD57KIbwCkPAOQUYON03zZIo-ikCg-1fV',
        messages: 12,
        id: 12),
  ];
}
