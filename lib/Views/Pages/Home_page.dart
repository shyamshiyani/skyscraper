import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scraper/Utils/Helper/Api_calling_helper.dart';
import '../../Controller/Theme_Povider.dart';
import '../../Models/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool themeData;
  late Future<WeatherModel?> getData;
  String currentCity = "jamnagar";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData = ApiCallingHelper.apiCallingHelper.fetchData(currentCity);
  }

  void _searchWeather() {
    setState(() {
      currentCity = searchController.text;
      getData = ApiCallingHelper.apiCallingHelper.fetchData(currentCity);
    });
  }

  @override
  Widget build(BuildContext context) {
    themeData = Provider.of<ThemeNotifier>(context, listen: false).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sky Scraper"),
        centerTitle: true,
        backgroundColor: themeData ? Colors.black : Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: themeData ? Colors.grey[850] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: themeData ? Colors.grey[850] : Colors.white,
                ),
                child: const CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAZP0uO36FlKPKrAPzyECDfdYkSYZcp3JpXrOk0VTGaH66CfhuQFBw9x3WdEk5GUm9XBQ&usqp=CAU"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Change Theme",
                    style: TextStyle(
                      fontSize: 18,
                      color: themeData ? Colors.white : Colors.black,
                    ),
                  ),
                  IconButton(
                    icon:
                        Icon((themeData) ? Icons.light_mode : Icons.dark_mode),
                    color: themeData ? Colors.white : Colors.black,
                    onPressed: () async {
                      Provider.of<ThemeNotifier>(context, listen: false)
                          .toggleTheme();

                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      prefs.setBool(
                          "IsDarkThem",
                          Provider.of<ThemeNotifier>(context, listen: false)
                              .isDarkMode);
                      setState(() {});
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  color: themeData ? Colors.white : Colors.black,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                filled: true,
                fillColor: themeData ? Colors.grey[800] : Colors.white,
                labelStyle: TextStyle(
                  color: themeData ? Colors.white : Colors.black,
                ),
                hintStyle: TextStyle(
                  color: themeData ? Colors.white70 : Colors.black54,
                ),
              ),
              style: TextStyle(
                color: themeData ? Colors.white : Colors.black,
              ),
              onSubmitted: (value) => _searchWeather(),
            ),
          ),
          FutureBuilder<WeatherModel?>(
            future: getData,
            builder: (context, snapShot) {
              if (snapShot.hasError) {
                return Center(
                  child: Text(
                    "No Data Found...",
                    style: TextStyle(
                      color: themeData ? Colors.white : Colors.black,
                    ),
                  ),
                );
              } else if (snapShot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapShot.hasData) {
                WeatherModel getData = snapShot.data!;
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'Detail_screen',
                        arguments: getData,
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: themeData ? Colors.grey[800] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${getData.name}",
                                  style: TextStyle(
                                    color:
                                        themeData ? Colors.white : Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${getData.tempC}°",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: themeData
                                        ? Colors.grey[400]
                                        : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text("No Data Found..."),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
