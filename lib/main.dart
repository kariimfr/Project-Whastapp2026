import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ======================================================
// MY APP
// ======================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF5F7F8),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ======================================================
// HOME PAGE
// ======================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Dini',
      'message': 'lau dimana bre',
      'time': '12:33',
      'unread': 3,
      'color': const Color.fromARGB(255, 223, 170, 9),
    },
    {
      'name': 'Ghiyas',
      'message': 'Gas, Maen hayu',
      'time': '16:10',
      'unread': 2,
      'color': Colors.orange,
    },
    {
      'name': 'Ubes',
      'message': 'Nanti jadi pergi?',
      'time': '15:45',
      'unread': 0,
      'color': Colors.purple,
    },
    {
      'name': 'Toto',
      'message': 'Oke siap',
      'time': '15:20',
      'unread': 1,
      'color': Colors.red,
    },
    {
      'name': 'Iqbal',
      'message': 'Jangan lupa tugasnya ya',
      'time': '14:50',
      'unread': 0,
      'color': Colors.pink,
    },
    {
      'name': 'Dika',
      'message': 'Sudah sampai?',
      'time': '14:20',
      'unread': 4,
      'color': Colors.teal,
    },
    {
      'name': 'Eka',
      'message': 'Besok masuk jam berapa?',
      'time': '13:40',
      'unread': 0,
      'color': Colors.indigo,
    },
    {
      'name': 'Fajar',
      'message': 'Makasih ya',
      'time': '13:15',
      'unread': 2,
      'color': Colors.deepOrange,
    },
    {
      'name': 'Galang',
      'message': 'Gas latihan nanti',
      'time': '12:50',
      'unread': 0,
      'color': Colors.green,
    },
    {
      'name': 'Hendra',
      'message': 'Oke bro',
      'time': '12:20',
      'unread': 1,
      'color': Colors.cyan,
    },
    {
      'name': 'Ilham',
      'message': 'Ada tugas baru?',
      'time': '11:50',
      'unread': 0,
      'color': Colors.amber,
    },
    {
      'name': 'Joko',
      'message': 'Nanti kabari aku',
      'time': '11:20',
      'unread': 2,
      'color': Colors.brown,
    },
    {
      'name': 'Kevin',
      'message': 'Siap hadir',
      'time': '10:45',
      'unread': 0,
      'color': Colors.deepPurple,
    },
    {
      'name': 'Lutfi',
      'message': 'Sampai jumpa',
      'time': '10:10',
      'unread': 1,
      'color': Colors.lightBlue,
    },
    {
      'name': 'Rizky',
      'message': 'Oke, terima kasih',
      'time': '09:45',
      'unread': 0,
      'color': Colors.lightGreen,
    },

    // CHAT KE-16
    {
      'name': 'Rian',
      'message': 'Sampai ketemu besok!',
      'time': '09:20',
      'unread': 5,
      'color': Colors.blueGrey,
    },

    // CHAT KE-17
    {
      'name': 'Salsa',
      'message': 'Jangan lupa datang ya',
      'time': '08:50',
      'unread': 0,
      'color': Colors.pinkAccent,
    },

    {
      'name': 'Yoga',
      'message': 'Mantap sekali',
      'time': '08:20',
      'unread': 2,
      'color': Colors.greenAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7F8),

        // =================================================
        // APP BAR
        // =================================================
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'WhatsApp',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),

          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_outlined),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],

          // =================================================
          // TAB BAR
          // =================================================
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.chat_bubble), text: 'Chat'),
              Tab(icon: Icon(Icons.circle_outlined), text: 'Status'),
              Tab(icon: Icon(Icons.call), text: 'Call'),
            ],
          ),
        ),

        // =================================================
        // TAB VIEW
        // =================================================
        body: TabBarView(
          children: [halamanChat(), halamanStatus(), halamanCall()],
        ),

        // =================================================
        // FLOATING BUTTON
        // =================================================
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF25D366),
          foregroundColor: Colors.white,
          onPressed: () {},
          child: const Icon(Icons.chat),
        ),
      ),
    );
  }

  // ======================================================
  // HALAMAN CHAT
  // ======================================================

  Widget halamanChat() {
    return Column(
      children: [
        const SizedBox(height: 40),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsetsGeometry.only(bottom: 80, top: 5),
            child: Column(
              children: [
                itemChat(
                  nama: chats[0]['name'],
                  pesan: chats[0]['message'],
                  waktu: chats[0]['time'],
                  jumlah: chats[0]['unread'],
                  warna: chats[0]['color'],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ======================================================
  // FILTER BUTTON
  // ======================================================

  Widget filterButton(String text, bool aktif) {
    return Container(
      margin: const EdgeInsetsGeometry.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: aktif ? const Color(0xFFD9FDD3) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: aktif ? const Color(0xFF25D366) : Colors.grey.shade300,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: aktif ? const Color(0xFF128C7E) : Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  // ======================================================
  // ITEM CHAT
  // ======================================================

  Widget itemChat({
    required String nama,
    required String pesan,
    required String waktu,
    required int jumlah,
    required Color warna,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 5),

              // =================================================
              // AVATAR
              // =================================================
              leading: CircleAvatar(
                radius: 27,
                backgroundColor: warna,
                child: Text(
                  nama.substring(0, 1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // =================================================
              // NAMA + PESAN
              // =================================================
              title: Text(
                nama,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),

              subtitle: Padding(
                padding: const EdgeInsetsGeometry.only(top: 5),
                child: Text(
                  pesan,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),

              // =================================================
              // WAKTU + BADGE
              // =================================================
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    waktu,
                    style: TextStyle(
                      color: jumlah > 0 ? const Color(0xFF128C7E) : Colors.grey,
                      fontSize: 11,
                      fontWeight:
                          jumlah > 0 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 6),
                  if (jumlah > 0)
                    Container(
                      width: 22,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xFF25D366),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          jumlah.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ======================================================
  // HALAMAN STATUS
  // ======================================================

  Widget halamanStatus() {
    return ListView(
      padding: const EdgeInsetsGeometry.only(top: 10),
      children: [
        const Padding(
          padding: EdgeInsets.all(18),
          child: Text(
            'Status',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),

        // STATUS SAYA
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 18),
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xFF128C7E),
                child: Icon(Icons.person, color: Colors.white, size: 30),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFF25D366),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
          title: const Text(
            'My status',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text('Tap to add status'),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(18, 20, 18, 10),
          child: Text(
            'Recent updates',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),

        statusItem('Duns', 'Today, 16:30', Colors.blue),

        statusItem('Fadlan', 'Today, 15:20', Colors.orange),
      ],
    );
  }

  // ======================================================
  // STATUS ITEM
  // ======================================================

  Widget statusItem(String nama, String waktu, Color warna) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF25D366), width: 3),
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: warna,
          child: Text(
            nama.substring(0, 1),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      title: Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(waktu, style: const TextStyle(color: Colors.grey)),
    );
  }

  // ======================================================
  // HALAMAN CALL
  // ======================================================

  Widget halamanCall() {
    return ListView(
      padding: const EdgeInsetsGeometry.only(top: 10),
      children: [
        const Padding(
          padding: EdgeInsets.all(18),
          child: Text(
            'Calls',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        callItem('Duns', 'Hari ini, 16:00', Colors.blue, Icons.call_received),
        callItem('Fadlan', 'Kemarin, 20:15', Colors.orange, Icons.call_made),
        callItem('Andi', 'Kemarin, 18:30', Colors.purple, Icons.call_received),
      ],
    );
  }

  // ======================================================
  // CALL ITEM
  // ======================================================

  Widget callItem(String nama, String waktu, Color warna, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        leading: CircleAvatar(
          radius: 27,
          backgroundColor: warna,
          child: Text(
            nama.substring(0, 1),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            Icon(icon, color: const Color(0xFF25D366), size: 17),
            const SizedBox(width: 5),
            Text(waktu, style: const TextStyle(color: Colors.grey)),
          ],
        ),
        trailing: const Icon(Icons.call, color: Color(0xFF128C7E)),
      ),
    );
  }
}
