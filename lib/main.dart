import 'package:flutter/material.dart';
import 'widgets/custom_card.dart';

void main() {
  runApp(SuperiorXRApp());
}

class SuperiorXRApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SuperiorXR',
      theme: ThemeData(
        primaryColor: Color(0xFF6A1B9A),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Color primaryPurple = Color(0xFF6A1B9A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // 🔹 APPBAR
      appBar: AppBar(
        title: Text("SuperiorXR"),
        centerTitle: true,
        backgroundColor: primaryPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),

      // 🔹 BODY
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            const CustomCard(
              title: "AR Navigation",
              description: "Guide users using augmented reality",
              icon: Icons.navigation,
            ),

            const CustomCard(
              title: "Chatbot",
              description: "Ask location via chatbot",
              icon: Icons.chat_bubble,
            ),

            const CustomCard(
              title: "VR Tour",
              description: "Explore campus in virtual reality",
              icon: Icons.vrpano,
            ),
          ],
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';

// SuperiorXR uses:
// - Cards for featured modules and campus highlights
// - ListView/ListTile for announcements, destinations, and chatbot history
// - GridView for quick-access services and campus facilities
// - CustomScrollView with Slivers for the dynamic home dashboard

void main() {
  runApp(const SuperiorXRApp());
}

class SuperiorXRApp extends StatelessWidget {
  const SuperiorXRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SuperiorXR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ARNavigationScreen(),
    ChatbotScreen(),
    VRTourScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.navigation), label: 'AR Nav'),
          BottomNavigationBarItem(
              icon: Icon(Icons.smart_toy), label: 'Chatbot'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_in_ar), label: 'VR Tour'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {'title': 'AR Navigation', 'icon': Icons.navigation},
      {'title': 'VR Campus Tour', 'icon': Icons.view_in_ar},
      {'title': 'AI Chatbot', 'icon': Icons.smart_toy},
      {'title': 'Campus Map', 'icon': Icons.map},
      {'title': 'Departments', 'icon': Icons.apartment},
      {'title': 'Events', 'icon': Icons.event},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('SuperiorXR'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.indigo],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.school, color: Colors.white, size: 50),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to SuperiorXR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Explore your campus in AR & VR',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Features',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                itemCount: features.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          features[index]['icon'] as IconData,
                          size: 50,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          features[index]['title'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ARNavigationScreen extends StatelessWidget {
  const ARNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AR Navigation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.navigation, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'AR Navigation Module',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Real-time campus navigation using Augmented Reality'),
          ],
        ),
      ),
    );
  }
}

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Chatbot')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _chatBubble('Hello! How can I help you today?', false),
                _chatBubble(
                    'Guide me to the Computer Science Department.', true),
                _chatBubble(
                    'Sure! Starting AR navigation to CS Department.', false),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ask something...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatBubble(String text, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class VRTourScreen extends StatelessWidget {
  const VRTourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('VR Campus Tour')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.view_in_ar, size: 100, color: Colors.deepPurple),
            SizedBox(height: 20),
            Text(
              'Virtual Campus Experience',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Explore the university in immersive 3D VR mode'),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Student Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Computer Science Department',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Navigation History'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About SuperiorXR'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
//Lab 8 by Saboor Ahmad_059
import 'package:flutter/material.dart';

// SuperiorXR uses:
// - Cards for featured modules and campus highlights
// - ListView/ListTile for announcements, destinations, and chatbot history
// - GridView for quick-access services and campus facilities
// - CustomScrollView with Slivers for the dynamic home dashboard

void main() {
  runApp(const SuperiorXRApp());
}

class SuperiorXRApp extends StatelessWidget {
  const SuperiorXRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SuperiorXR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // I have added this variable to store data returned from Gratitude page (Lab 8)
  String _selectedPlace = "...";

  final List<Widget> _screens = const [
    HomeScreen(),
    ARNavigationScreen(),
    ChatbotScreen(),
    VRTourScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // I have added Navigator.push to open About Page (Lab 8)
  void _openAbout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const AboutPage(),
      ),
    );
  }

  // I have added Navigator with return value (Lab 8)
  void _openGratitude(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GratitudePage(),
      ),
    );

    setState(() {
      _selectedPlace = result ?? "...";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SuperiorXR ($_selectedPlace)"),

        // I have added IconButton to open About page using Navigator (Lab 8)
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _openAbout(context),
          )
        ],
      ),

      body: _screens[_selectedIndex],

      // I have added FloatingActionButton to open Gratitude page (Lab 8)
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openGratitude(context),
        child: const Icon(Icons.sentiment_satisfied),
      ),

      // I have used BottomNavigationBar (Lab 8 widget)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.navigation), label: 'AR Nav'),
          BottomNavigationBarItem(
              icon: Icon(Icons.smart_toy), label: 'Chatbot'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_in_ar), label: 'VR Tour'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),

      // I have added BottomAppBar with notch (Lab 8 optional feature)
      bottomSheet: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home),
            Icon(Icons.map),
            SizedBox(width: 40),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////
/// I have added About Page for Navigator (Lab 8)
////////////////////////////////////////////////////////
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: const Center(
        child: Text("This is SuperiorXR Campus Guide App"),
      ),
    );
  }
}

////////////////////////////////////////////////////////
/// I have added Gratitude Page with Radio buttons (Lab 8)
////////////////////////////////////////////////////////
class GratitudePage extends StatefulWidget {
  const GratitudePage({super.key});

  @override
  State<GratitudePage> createState() => _GratitudePageState();
}

class _GratitudePageState extends State<GratitudePage> {
  int _value = -1;
  List<String> places = ["Library", "Cafe", "Lab"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Place"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => Navigator.pop(context, places[_value]),
          )
        ],
      ),
      body: Column(
        children: List.generate(places.length, (index) {
          return Row(
            children: [
              Radio(
                value: index,
                groupValue: _value,
                onChanged: (val) {
                  setState(() {
                    _value = val!;
                  });
                },
              ),
              Text(places[index])
            ],
          );
        }),
      ),
    );
  }
}

////////////////////////////////////////////////////////
/// I have implemented Hero Animation (Lab 8)
////////////////////////////////////////////////////////
class ARNavigationScreen extends StatelessWidget {
  const ARNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AR Navigation')),
      body: Center(
        child: GestureDetector(
          child: const Hero(
            tag: "arHero",
            child: Icon(Icons.navigation, size: 100, color: Colors.blue),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ARDetailScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////
/// I have added Hero destination screen (Lab 8)
////////////////////////////////////////////////////////
class ARDetailScreen extends StatelessWidget {
  const ARDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.shortestSide / 2;

    return Scaffold(
      appBar: AppBar(title: const Text("AR Detail")),
      body: Center(
        child: Hero(
          tag: "arHero",
          child: Icon(Icons.navigation, size: size, color: Colors.blue),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const CampusGuideApp());
}

// Lab 9
// Flutter TabBar and Drawer
// By Javeria Nawal
// AI Powered AR/VR Campus Guide

class CampusGuideApp extends StatelessWidget {
  const CampusGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Campus Guide',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AI Powered AR/VR Campus Guide",
        ),
      ),
      drawer: const LeftDrawerWidget(),
      endDrawer: const RightDrawerWidget(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ARVRPage(),
          AIPage(),
          ReminderPage(),
        ],
      ),
      bottomNavigationBar: Material(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.deepPurple,
          tabs: const [
            Tab(
              icon: Icon(Icons.view_in_ar),
              text: 'AR/VR',
            ),
            Tab(
              icon: Icon(Icons.smart_toy),
              text: 'AI Guide',
            ),
            Tab(
              icon: Icon(Icons.notifications),
              text: 'Reminders',
            ),
          ],
        ),
      ),
    );
  }
}

class ARVRPage extends StatelessWidget {
  const ARVRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        Icon(
          Icons.view_in_ar,
          size: 100,
          color: Colors.deepPurple,
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(Icons.map),
          title: Text("Smart Navigation"),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text("Indoor Tracking"),
        ),
        ListTile(
          leading: Icon(Icons.vrpano),
          title: Text("360 VR Tours"),
        ),
      ],
    );
  }
}

class AIPage extends StatelessWidget {
  const AIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.smart_toy,
            size: 100,
            color: Colors.deepPurple,
          ),
          SizedBox(height: 20),
          Text(
            "AI Campus Assistant",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.event),
          title: Text("Campus Events"),
        ),
        ListTile(
          leading: Icon(Icons.assignment),
          title: Text("Assignments"),
        ),
        ListTile(
          leading: Icon(Icons.school),
          title: Text("Exam Alerts"),
        ),
      ],
    );
  }
}

class MenuListTileWidget extends StatelessWidget {
  const MenuListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
        )
      ],
    );
  }
}

class LeftDrawerWidget extends StatelessWidget {
  const LeftDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
            accountName: Text("Superior Student"),
            accountEmail: Text("student@superior.edu.pk"),
          ),
          MenuListTileWidget()
        ],
      ),
    );
  }
}

class RightDrawerWidget extends StatelessWidget {
  const RightDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Icon(
              Icons.person,
              size: 80,
              color: Colors.white,
            ),
          ),
          MenuListTileWidget()
        ],
      ),
    );
  }
}

