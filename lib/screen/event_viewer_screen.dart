
import 'package:agmo_pre_test/provider/event_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modals/event.dart';
import '../widgets/event_list_tile.dart';

class EventViewerScreen extends StatelessWidget {
  final TextEditingController searchBarTextEditController = TextEditingController();
   EventViewerScreen({super.key});

   

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height =  MediaQuery.of(context).size.height;
    final EventListProvider eventListProvider = Provider.of<EventListProvider>(context, listen: false);

 
    return Scaffold(
        appBar: _buildEventViewerAppBar(),
        backgroundColor: Colors.orange, 
        body: Stack(
    
          children: [
             Positioned(
            top: height * 0.1,
            right: 0,
            left: 0,
            child: Image.asset(
              "assets/images/app_background/element_curve_blue.png", // Replace with your image asset
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: height * 0.2,
            right: 0,
            bottom: 0,
            left: 0,
            child:const ColoredBox(color : Color(0xFFA2CCFD)),
          ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
    
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  _buildSearchBar(searchBarTextEditController,
                  onChanged: (value) {
                    eventListProvider.filterEventsBySearchString(value);
                  }
                  ),
                  const SizedBox(height: 20,),
                  const EventListTile(),
                ],
                 
              ),
            ),
          ],
        ));
  }
}

AppBar _buildEventViewerAppBar() {
  return AppBar(
    forceMaterialTransparency: true,
    backgroundColor: Colors.orange.shade400,
    title: const Text(
      'Activities & Events',
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {},
    ),
  );
}


Widget _buildSearchBar(TextEditingController controller,{ValueChanged<String>? onChanged}) {
  return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search activities & events',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: const Icon(Icons.search), // You can customize this based on your needs
      ),
      
    );
}






List<EventModel> filterModelList(List<EventModel> eventList, String filter) {
  return eventList.where((element) => element.eventName.toLowerCase().contains(filter.toLowerCase())).toList();
}
