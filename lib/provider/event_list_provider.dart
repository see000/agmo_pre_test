import 'package:agmo_pre_test/data/sample_data.dart';
import 'package:flutter/material.dart';

import '../modals/event.dart';

class EventListProvider with ChangeNotifier {
  List<EventModel> events = [];

  void loadEvents (){
    events = sampleData;
  }
  void filterEventsBySearchString(String searchString) {
    
    if (searchString == '') {
      loadEvents();
    }else{
      events = sampleData.where(
        (event){
        return event.eventName.toLowerCase().contains(searchString.toLowerCase());
      }
      ).toList();
    }
    notifyListeners();
  }
}
