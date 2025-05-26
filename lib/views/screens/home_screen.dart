import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/music_services_viewmodel.dart';
import '../../widgets/custom_list_view.dart';
import '../../widgets/custom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<MusicServicesViewModel>().loadMusicServices(),
    );
  }

  BottomNavigationBarItem _buildCustomNavItem(String assetPath, String label, int index) {
    bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (isSelected)
            Positioned(
              top: -15,
              child: CustomPaint(
                size: const Size(24, 12),
                painter: TopHalfCirclePainter(),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Image.asset(
              assetPath,
              height: 24,
              width: 24,
              color: isSelected ? Colors.white : Colors.white70,
            ),
          ),
        ],
      ),
      label: label,
    );
  }


  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<MusicServicesViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.error != null) {
              return Center(child: Text(viewModel.error!));
            }

            return Column(
             children: [
               Stack(
                 children: [
                   Container(
                     width: double.infinity,
                     padding: const EdgeInsets.all(16),
                     decoration: const BoxDecoration(
                       gradient: LinearGradient(
                         begin: Alignment.topCenter,
                         end: Alignment.bottomCenter,
                         colors: [Color(0xFFA90140), Color(0xFF550120)],
                       ),
                       borderRadius: BorderRadius.only(
                         bottomLeft: Radius.circular(20),
                         bottomRight: Radius.circular(20),
                       ),
                     ),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Expanded(
                               child: TextField(
                                 style: const TextStyle(color: Colors.white, fontSize: 16),
                                 decoration: InputDecoration(
                                   filled: true,
                                   fillColor: const Color(0xFF2A2A2A),
                                   prefixIcon: const Icon(Icons.search, color: Colors.white70, size: 22),
                                   suffixIcon: const Icon(Icons.mic, color: Colors.white70, size: 22),
                                   hintText: 'Search "Punjabi Lyrics"',
                                   hintStyle: const TextStyle(color: Colors.white54, fontSize: 16),
                                   border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10),
                                     borderSide: BorderSide.none,
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10),
                                     borderSide: BorderSide.none,
                                   ),
                                   focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10),
                                     borderSide: BorderSide.none,
                                   ),
                                   contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                                 ),
                               ),
                             ),
                             const SizedBox(width: 10),
                             const CircleAvatar(
                               backgroundColor: Colors.white24,
                               child: Icon(Icons.account_circle, color: Colors.white),
                             ),
                           ],
                         ),
                         const SizedBox(height: 20),
                         Column(
                           children: [
                             Text(
                               'Claim your',
                               style: GoogleFonts.sansita(
                                 fontSize: 18,
                                 color: Colors.white,
                               ),
                               textAlign: TextAlign.center,
                             ),
                             Text(
                               'Free Demo',
                               style: GoogleFonts.dancingScript(
                                 fontSize: 48,
                                 fontWeight: FontWeight.w700,
                                 color: Colors.white,
                               ),
                               textAlign: TextAlign.center,
                             ),
                             Text(
                               'for custom Music Production',
                               style: GoogleFonts.sansita(color: Colors.white70, fontSize: 14),
                               textAlign: TextAlign.center,
                             ),
                           ],
                         ),
                         const SizedBox(height: 30),
                         ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.white,
                             foregroundColor: Colors.black,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(25),
                             ),
                             elevation: 6,
                           ),
                           onPressed: () {
                           },
                           child: const Text(
                             'Book Now',
                             style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontSize: 16,
                             ),
                           ),
                         ),
                         const SizedBox(height: 20),
                       ],
                     ),
                   ),
                   Positioned(
                     left: -40,
                     bottom: 20,
                     child: ClipRRect(
                       borderRadius: const BorderRadius.only(
                         bottomLeft: Radius.circular(20),
                       ),
                       child: Image.asset(
                         'assets/images/disc.png',
                         height: 120,
                         width: 120,
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                   Positioned(
                     right: -50,
                     bottom: 30,
                     child: Image.asset(
                       'assets/images/keyboard.png',
                       height: 100,
                       width: 140,
                       fit: BoxFit.cover,
                     ),
                   ),
                 ],
               ),
               SizedBox(height: 10,),
               Text("Hire Hand-picked pros for Popular music service",style: GoogleFonts.sansita(color: Colors.white),),
               Expanded(
                 child: ServiceListView(services: viewModel.services),
               ),
             ],
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF202126),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            _buildCustomNavItem('assets/icons/home.png', 'Home', 0),
            _buildCustomNavItem('assets/icons/news.png', 'News', 1),
            _buildCustomNavItem('assets/icons/track.png', 'Track Box', 2),
            _buildCustomNavItem('assets/icons/projects.png', 'Projects', 3),
          ],
        ),


      ),
    );
  }
}
