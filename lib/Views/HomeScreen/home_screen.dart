import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Providers/json_providing.dart';
import '../BookmarkScreen/bookmark_screen.dart';
import '../DetaileScreen/detailed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  int _currentPage = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    JsonProvider provider = Provider.of<JsonProvider>(context, listen: true);

    Widget _buildHomeScreen() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Hi Aayush,',
              style: GoogleFonts.roboto(fontSize: 22, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Which planet\nwould you like to explore?',
              style: GoogleFonts.roboto(
                  fontSize: 25,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
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
              itemCount: provider.userList.length,
              itemBuilder: (context, index) {
                final planet = provider.userList[index];
                final isBookmarked = provider.bookmarkedList.contains(planet);

                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                    }

                    return Center(
                      child: Transform(
                        transform: Matrix4.identity()..scale(value, value),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: RotationTransition(
                                turns: _animationController,
                                child: Image.network(
                                  planet.image,
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.arrow_back_ios,
                                        color: Colors.white),
                                    onPressed: () {
                                      if (_currentPage > 0) {
                                        _pageController.previousPage(
                                          duration: Duration(seconds: 1),
                                          curve: Curves.easeInOutCirc,
                                        );
                                      }
                                    },
                                  ),
                                  SizedBox(width: 50),
                                  Column(
                                    children: [
                                      Text(
                                        planet.name,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        planet.subtitle,
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          isBookmarked
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          provider.toggleBookmark(planet);
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 50),
                                  IconButton(
                                    icon: const Icon(Icons.arrow_forward_ios,
                                        color: Colors.white),
                                    onPressed: () {
                                      if (_currentPage <
                                          provider.userList.length - 1) {
                                        _pageController.nextPage(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeInQuart,
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 100),
                            Center(
                              child: OutlinedButton(
                                onPressed: () {
                                  // Navigate to the DetailScreen and pass the planet data
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailScreen(planet: planet),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 120, vertical: 12),
                                ),
                                child: const Text(
                                  'Explore planet',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Space',
            style:
            GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BookmarkScreen(),
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Ai Photo.jpg'),
            ),
          ),
        ],
      ),
      body: _selectedIndex == 3 ? const BookmarkScreen() : _buildHomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,

        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
            icon: Icon(Icons.favorite),
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
