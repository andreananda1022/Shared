import 'package:flutter/material.dart';

void main() {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carveo',
      debugShowCheckedModeBanner: false,
      home: CarveoHomePage(),
    );
  }
}

class CarveoHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF006C70)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Login'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF006C70),
        title: Text('Carveo', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.account_circle_outlined),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Akses Akun'),
                      content: SizedBox(
                        width: double.maxFinite,
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TabBar(
                                labelColor: Colors.black,
                                indicatorColor: Color(0xFF006C70),
                                tabs: [Tab(text: 'Login'), Tab(text: 'Daftar')],
                              ),
                              SizedBox(
                                height: 250,
                                child: TabBarView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Username',
                                            ),
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                            ),
                                            obscureText: true,
                                          ),
                                          SizedBox(height: 16),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Login',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(
                                                0xFF006C70,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Tab Daftar
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Nama Lengkap',
                                            ),
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Email',
                                            ),
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                            ),
                                            obscureText: true,
                                          ),
                                          SizedBox(height: 16),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(
                                                0xFF006C70,
                                              ),
                                            ),
                                            child: Text(
                                              'Daftar',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Tutup'),
                          style: TextButton.styleFrom(
                            foregroundColor: Color(0xFF006C70),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Color(0xFF006C70),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Text(
                  'Selamat Datang di Carveo',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add_road, color: Colors.white),
                  label: Text('Buat Janji Servis'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: StadiumBorder(),
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              padding: EdgeInsets.all(16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 2;

                  if (constraints.maxWidth > 1200) {
                    crossAxisCount = 5;
                  } else if (constraints.maxWidth > 800) {
                    crossAxisCount = 4;
                  } else if (constraints.maxWidth > 600) {
                    crossAxisCount = 3;
                  }

                  return GridView.builder(
                    padding: EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final menuItems = [
                        {
                          'icon': Icons.build,
                          'label': 'Servis',
                          'color': Colors.orange,
                          'page': ServisPage(),
                        },
                        {
                          'icon': Icons.car_repair,
                          'label': 'Sparepart',
                          'color': Colors.blue,
                          'page': SparepartPage(),
                        },
                        {
                          'icon': Icons.calendar_today,
                          'label': 'Booking',
                          'color': Colors.green,
                          'page': BookingPage(),
                        },
                        {
                          'icon': Icons.local_offer,
                          'label': 'Promo',
                          'color': Colors.purple,
                          'page': PromoPage(),
                        },
                        {
                          'icon': Icons.history,
                          'label': 'Riwayat',
                          'color': Colors.teal,
                          'page': RiwayatPage(),
                        },
                        {
                          'icon': Icons.support_agent,
                          'label': 'Bantuan',
                          'color': Colors.red,
                          'page': BantuanPage(),
                        },
                      ];

                      final item = menuItems[index];

                      return buildMenuCard(
                        context,
                        item['icon'] as IconData,
                        item['label'] as String,
                        item['color'] as Color,
                        item['page'] as Widget,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuCard(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    Widget targetPage,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 2,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 32),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Servis")),
      body: Center(child: Text("Halaman Servis")),
    );
  }
}

class SparepartPage extends StatelessWidget {
  final List<Map<String, String>> spareparts = [
    {
      'name': 'Oli Mesin',
      'image':
          'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/11/16/977ca430-beb0-405f-87bd-5de290d84525.jpg',
    },
    {
      'name': 'Aki Mobil',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ_8w8Mr585kQgBM6oN_7Oerjptw-ogz3zRA&s',
    },
    {
      'name': 'Filter Udara',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGX0EeIhHhjJwki7OjQWTxe92YQLNwUaGxTA&s',
    },
    {
      'name': 'Kampas Rem',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY8wSW16A_U0Z3-Nsy4fpEJM8jNcBw28YtUw&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Sparepart")),
      body: ListView.builder(
        itemCount: spareparts.length,
        itemBuilder: (context, index) {
          final item = spareparts[index];
          return Card(
            margin: EdgeInsets.all(12),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Gambar responsif dengan AspectRatio
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    item['image']!,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          child: Icon(Icons.broken_image, size: 60),
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    item['name']!,
                    style: TextStyle(
                      fontSize: screenWidth < 600 ? 16 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking")),
      body: Center(child: Text("Halaman Booking")),
    );
  }
}

class PromoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Promo")),
      body: Center(child: Text("Halaman Promo")),
    );
  }
}

class RiwayatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Riwayat")),
      body: Center(child: Text("Halaman Riwayat")),
    );
  }
}

class BantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bantuan")),
      body: Center(child: Text("Halaman Bantuan")),
    );
  }
}
