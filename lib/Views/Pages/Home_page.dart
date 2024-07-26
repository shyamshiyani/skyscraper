import 'package:flutter/material.dart';
import 'package:sky_scraper/Utils/Helper/Api_calling_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sky Scraper"),
          centerTitle: true,
        ),
        drawer: const Drawer(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerHeader(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAZP0uO36FlKPKrAPzyECDfdYkSYZcp3JpXrOk0VTGaH66CfhuQFBw9x3WdEk5GUm9XBQ&usqp=CAU"),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter city name',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      ApiCallingHelper.apiCallingHelper.fetchData();
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
