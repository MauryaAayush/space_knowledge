// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../Providers/json_providing.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     JsonProvider provider = Provider.of<JsonProvider>(context, listen: true);
//     JsonProvider providerF = Provider.of<JsonProvider>(context, listen: false);
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('JSON Parsing'),
//       ),
//       body: ListView.builder(
//         itemCount: provider.userList.length,
//         itemBuilder: (context, index) {
//           final planet = provider.userList[index];
//           return ListTile(
//             leading: Image.network(
//               planet.image,
//               width: 50,
//               height: 50,
//               fit: BoxFit.cover,
//             ),
//             title: Text(planet.name),
//             subtitle: Text(planet.description),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> planets = [
    {
      'name': 'MERCURY',
      'subtitle': 'THE LIVING PLANET',
      'image': 'http://space-facts.com/wp-content/uploads/mercury-transparent.png',
    },
    {
      'name': 'VENUS',
      'subtitle': 'THE SISTER PLANET',
      'image': 'http://space-facts.com/wp-content/uploads/venus-transparent.png',
    },
    {
      'name': 'EARTH',
      'subtitle': 'OUR HOME PLANET',
      'image': 'http://space-facts.com/wp-content/uploads/earth-transparent.png',
    },
    // Add more planets as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://example.com/profile-pic.jpg'), // Your profile image URL
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Hi Aayush,',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Which planet\nwould you like to explore?',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: planets.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(Icons.circle, size: 250, color: Colors.white.withOpacity(0.1)),
                          Image.network(
                            planets[index]['image']!,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                            onPressed: () {
                              if (_currentPage > 0) {
                                _pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                          ),
                          SizedBox(width: 24),
                          Column(
                            children: [
                              Text(
                                planets[index]['name']!,
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Text(
                                planets[index]['subtitle']!,
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(width: 24),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                            onPressed: () {
                              if (_currentPage < planets.length - 1) {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: OutlinedButton(
                        onPressed: () {
                          // Explore planet action
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: Text(
                          'Explore planet',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
