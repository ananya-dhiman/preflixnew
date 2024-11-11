import 'package:flutter/material.dart';
import 'obj.dart';
import 'api.dart';

class MovieDetailsPage extends StatefulWidget {
  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  // Dummy data placeholders
  String title = "DHOKA";
  String genre = "Charming Feel-Good Dramedy Movie";
  String year = "2024";
  String summary =
      "Charming Feel-Good Dramedy Movie\nCharming Feel-Good Dramedy Movie\nCharming Feel-Good Dramedy Movie";
  String imageUrl =
      "https://via.placeholder.com/300x200"; // Placeholder image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.movie, color: Colors.yellow),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.download, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Movie Image
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            // Movie Title
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            // Genre and Year
            Text(
              "$genre\n$year",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            // Play Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
              
              ),
              onPressed: () {},
              icon: Icon(Icons.play_arrow),
              label: Text("Play"),
            ),
            SizedBox(height: 10),
            // Summary
            Text(
              summary,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            // Back Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: MovieDetailsPage(),
));
