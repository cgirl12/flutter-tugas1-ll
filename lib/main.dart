// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              decoration: const BoxDecoration(),
              child: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor:
                    Colors.orange, // Transparent untuk menunjukkan gradient
                elevation: 0, // Menghapus shadow
                centerTitle: true,
                title: const Text(
                  'Portfolio',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text(
                    'Danny Firmansyah',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  accountEmail: const Text('dannyfrmnsyh@gmail.com',
                      style: TextStyle(color: Colors.white)),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        fit: BoxFit.cover,
                        'assets/danny-me.jpg',
                        width: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://img.freepik.com/free-photo/sunset-time-tropical-beach-sea-with-coconut-palm-tree_74190-1075.jpg'))),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.people_alt,
                    color: Colors.orange,
                  ),
                  title: const Text('Portfolio'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.orange,
                  ),
                  title: const Text('WhatsApp'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://wa.me/6281248352442?text=Hello');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.instagram,
                      color: Colors.orange),
                  title: const Text('Instagram'),
                  onTap: () async {
                    final Uri url = Uri.parse(
                        'https://www.instagram.com/dnnythemvp_?igsh=MTc3cTR0MG41bnZo');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  thickness: 1, // Ketebalan garis
                  color: Colors.yellow, // Warna garis
                  indent: 16, // Jarak dari sisi kiri
                  endIndent: 16, // Jarak dari sisi kanan
                ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.orange,
                  ),
                  title: const Text('Logout'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Apakah anda yakin ingin keluar?'),
                        actions: [
                          TextButton(
                            child: const Text('Batal'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Keluar',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Card Content
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          // Profile Avatar
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.orange, // Ungu dengan hex
                                  Colors.purple, // Ungu bawaan Flutter
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),

                            padding:
                                const EdgeInsets.all(4), // Ketebalan outline
                            child: const CircleAvatar(
                              radius: 100, // Ukuran lingkaran avatar
                              backgroundImage:
                                  AssetImage('assets/danny-me.jpg'),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'Danny Firmansyah',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange, // Warna indigo 700
                            ),
                          ),

                          const SizedBox(height: 10),
                          const Text(
                            'Mahasiswa',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey, // Warna indigo 700
                            ),
                          ),

                          // Setelah deskripsi tentang saya
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Experience
                              Column(
                                children: [
                                  // Ikon dengan latar belakang lingkaran
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0x80FFE0B2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.only(
                                      top: 25, // Padding atas
                                      bottom: 5, // Padding bawah
                                      left: 30, // Padding kiri
                                      right: 30, // Padding kanan
                                    ), // Ruang di sekitar konten
                                    // ignore: duplicate_ignore
                                    // ignore: prefer_const_constructors
                                    child: Column(
                                      mainAxisSize: MainAxisSize
                                          .min, // Sesuaikan ukuran dengan konten
                                      children: const [
                                        // Ikon
                                        Icon(
                                          Icons.school,
                                          size: 40,
                                          color: Colors.orange, // Ikon biru
                                        ),
                                        SizedBox(
                                            height:
                                                10), // Jarak antara ikon dan teks
                                        // Teks "Experience"
                                        Text(
                                          'Semester',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                5), // Jarak antara teks judul dan deskripsi
                                        // Teks "3+ Years"
                                        Text(
                                          '5 th',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              // Project
                              Column(
                                children: [
                                  // Ikon dengan latar belakang lingkaran
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0x80FFE0B2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    padding: const EdgeInsets.only(
                                      top: 25, // Padding atas
                                      bottom: 5, // Padding bawah
                                      left: 45, // Padding kiri
                                      right: 45, // Padding kanan
                                    ), // Ruang di sekitar konten
                                    // ignore: duplicate_ignore
                                    // ignore: prefer_const_constructors
                                    child: Column(
                                      mainAxisSize: MainAxisSize
                                          .min, // Sesuaikan ukuran dengan konten
                                      children: const [
                                        // Ikon
                                        Icon(
                                          Icons.calendar_month,
                                          size: 40,
                                          color: Colors.orange, // Ikon ungu
                                        ),
                                        SizedBox(
                                            height:
                                                10), // Jarak antara ikon dan teks
                                        // Teks "Experience"
                                        Text(
                                          'Umur',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                5), // Jarak antara teks judul dan deskripsi
                                        // Teks "3+ Years"
                                        Text(
                                          '20',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orangeAccent,
                                  size: 40,
                                ),
                                SizedBox(
                                    height: 10), // Jarak antara ikon dan teks
                                Text(
                                  'Skill',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign:
                                      TextAlign.center, // Pusatkan teks judul
                                ),
                                SizedBox(
                                    height:
                                        10), // Jarak antara judul dan daftar skill
                                Wrap(
                                  spacing: 10, // Jarak horizontal antar elemen
                                  runSpacing: 10, // Jarak vertikal antar elemen
                                  alignment: WrapAlignment.center,
                                  children: [
                                    _buildSkillButton('PHP'),
                                    _buildSkillButton('Dart'),
                                    _buildSkillButton('HTML'),
                                    _buildSkillButton('CSS'),
                                    _buildSkillButton('Bootstrap'),
                                    _buildSkillButton('Flutter'),
                                    _buildSkillButton('MySQL'),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

Widget _buildSkillButton(String skill) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.orangeAccent, // Warna latar belakang tombol
      borderRadius: BorderRadius.circular(20), // Membuat sudut melengkung
    ),
    child: Text(
      skill,
      style: TextStyle(
        color: Colors.white, // Warna teks
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
