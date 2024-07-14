import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_knowledge/Model/model_class.dart';

class DetailScreen extends StatefulWidget {
  final Planet planet;

  const DetailScreen({Key? key, required this.planet}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.network(
              widget.planet.image, // or use a different image URL for the background
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.6), // Adjust opacity for better readability
              colorBlendMode: BlendMode.darken,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 54),
                  Center(
                    child: RotationTransition(
                      turns: _controller,
                      child: Image.network(
                        widget.planet.image,
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    widget.planet.name,
                    style: GoogleFonts.roboto(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    widget.planet.subtitle,
                    style:
                    GoogleFonts.roboto(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'About ${widget.planet.name}',
                    style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.planet.description,
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 24),
                  // Image.network(
                  //   widget.planet.additionalImage, // Assuming there's another image for details
                  //   fit: BoxFit.cover,
                  // ),
                  SizedBox(height: 24),
                  Text(
                    'Distance from Sun: ${widget.planet.distance} million km',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Velocity: ${widget.planet.position}',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Length of day: ${widget.planet.length_of_day}',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Orbital period: ${widget.planet.orbital_period}',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Gravity: ${widget.planet.gravity}',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Surface area: ${widget.planet.surface_area}',
                    style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        // Take a trip action
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
                        padding:
                        EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                      ),
                      child: Text(
                        'Take a trip',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
