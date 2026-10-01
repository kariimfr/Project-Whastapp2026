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
          backgroundColor: Color.fromARGB(255, 0, 64, 255),
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
      'name': 'Riem',
      'message': 'main lah yoo..',
      'time': '16:30',
      'unread': 3,
      'color': const Color.fromARGB(255, 33, 243, 215),
    },
    {
      'name': 'Irfhan',
      'message': 'Lagi dimana bre?',
      'time': '15:10',
      'unread': 2,
      'color': Colors.red,
    },
    {
      'name': 'Jack',
      'message': 'Tadi lu dimana? gw udah ke rumah lu padahal',
      'time': '15:20',
      'unread': 1,
      'color': Colors.green,
    },
    {
      'name': 'Eka',
      'message': 'Gw juara 1 gitar solo, thanks buat dukungan nya bre',
      'time': '13:40',
      'unread': 0,
      'color': Colors.indigo,
    },
    {
      'name': 'Fajar',
      'message': 'Besok gw ganti ya..',
      'time': '13:15',
      'unread': 2,
      'color': Colors.deepOrange,
    },
    {
      'name': 'Abid',
      'message': 'Latihan bola barengin ya..',
      'time': '12:50',
      'unread': 0,
      'color': Colors.green,
    },
    {
      'name': 'Ilham',
      'message': 'Besok izinin gw masuk sekolah ya..',
      'time': '21:50',
      'unread': 0,
      'color': Colors.amber,
    },
    {
      'name': 'Lutfi',
      'message': 'Gw tunggu di lapangan..',
      'time': '10:10',
      'unread': 1,
      'color': Colors.lightBlue,
    },
    {
      'name': 'Eky',
      'message': 'Oke, nanti gw anterin',
      'time': '09:45',
      'unread': 0,
      'color': Colors.lightGreen,
    },
    {
      'name': 'Salsa',
      'message': 'Jangan lupa datang ya ke ultah gw',
      'time': '08:50',
      'unread': 0,
      'color': Colors.pinkAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7F8),

        // APP BAR
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'WhatsApp',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
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

        // TAB VIEW
        body: TabBarView(
          children: [
            halamanChat(),
            halamanStatus(),
            halamanCall(),
          ],
        ),

        // FLOATING BUTTON
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 61, 93, 255),
          foregroundColor: Colors.white,
          onPressed: () {},
          child: const Icon(Icons.chat),
        ),
      ),
    );
  }

  // ======================================================
  // HALAMAN CHAT (Menggunakan Column & ListView)
  // ======================================================

  Widget halamanChat() {
    return Column(
      children: [
        // Search Box disatukan menggunakan Padding
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  'Cari chat...',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
        ),

        // Filter Horizontal menggunakan ListView
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              filterButton('Semua', true),
              filterButton('Belum dibaca', false),
              filterButton('Grup', false),
            ],
          ),
        ),

        const SizedBox(height: 5),

        // List Chat menggunakan ListView.builder
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 80, top: 5),
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index];
              return itemChat(
                nama: chat['name'],
                pesan: chat['message'],
                waktu: chat['time'],
                jumlah: chat['unread'],
                warna: chat['color'],
              );
            },
          ),
        ),
      ],
    );
  }

  // FILTER BUTTON
  Widget filterButton(String text, bool aktif) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color:
              aktif ? const Color.fromARGB(255, 149, 173, 254) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: aktif
                ? const Color.fromARGB(255, 37, 75, 211)
                : Colors.grey.shade300,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color:
                aktif ? const Color.fromARGB(255, 23, 50, 183) : Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  // ITEM CHAT (Menggunakan Padding & Column)
  Widget itemChat({
    required String nama,
    required String pesan,
    required String waktu,
    required int jumlah,
    required Color warna,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Container(
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
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
          title: Text(
            nama,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              pesan,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                waktu,
                style: TextStyle(
                  color: jumlah > 0 ? const Color(0xFF128C7E) : Colors.grey,
                  fontSize: 11,
                  fontWeight: jumlah > 0 ? FontWeight.bold : FontWeight.normal,
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
    );
  }

  // ======================================================
  // HALAMAN STATUS (Menggunakan ListView & Padding)
  // ======================================================

  Widget halamanStatus() {
    return ListView(
      padding: const EdgeInsets.only(top: 10),
      children: [
        const Padding(
          padding: EdgeInsets.all(18),
          child: Text(
            'Status',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
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
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
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
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
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
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        statusItem('jack', 'Hari ini, 05:00', Colors.purple),

        statusItem('Riem', 'Hari ini, 12:20', Colors.red),

        statusItem(
            'Eka', 'Hari ini, 21:04', const Color.fromARGB(255, 54, 60, 244)),

        statusItem(
            'Irfhan', 'Kemarin, 08:34', const Color.fromARGB(255, 11, 161, 51)),

        statusItem(
            'Eky', 'Kemarin, 08:02', const Color.fromARGB(255, 145, 29, 116)),

        statusItem(
            'Salsa', 'Kemarin, 07:40', const Color.fromARGB(255, 212, 91, 82)),

        statusItem(
            'Fajar', 'Kemarin, 06:32', const Color.fromARGB(255, 244, 181, 54)),
      ],
    );
  }

  // STATUS ITEM
  Widget statusItem(String nama, String waktu, Color warna) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF25D366),
              width: 3,
            ),
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
        title: Text(
          nama,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          waktu,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  // ======================================================
  // HALAMAN CALL (Menggunakan ListView & Padding)
  // ======================================================

  Widget halamanCall() {
    return ListView(
      padding: const EdgeInsets.only(top: 10),
      children: [
        const Padding(
          padding: EdgeInsets.all(18),
          child: Text(
            'Calls',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        callItem('Riem', 'Hari ini, 17:02', Colors.blue, Icons.call_received),
        callItem('Fadlan', 'Hari ini, 20:15', Colors.orange, Icons.call_made),
        callItem('Fajar', 'Kemarin, 18:30',
            const Color.fromARGB(255, 39, 176, 71), Icons.call_received),
        callItem('Abid', 'Kemarin, 17:49',
            const Color.fromARGB(255, 39, 137, 176), Icons.call_received),
        callItem('Irfhan', '30 Sep, 08:30',
            const Color.fromARGB(255, 149, 255, 146), Icons.call_received),
        callItem('Eka', '25 Sep, 13:34', const Color.fromARGB(255, 197, 77, 22),
            Icons.call_received),
      ],
    );
  }

  // CALL ITEM (Menggunakan Padding & Column)
  Widget callItem(String nama, String waktu, Color warna, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Container(
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
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
          title: Text(
            nama,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFF25D366),
                size: 17,
              ),
              const SizedBox(width: 5),
              Text(
                waktu,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.call,
            color: Color(0xFF128C7E),
          ),
        ),
      ),
    );
  }
}
