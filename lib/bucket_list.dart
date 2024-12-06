import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bucket List',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const BucketListPage(),
    );
  }
}

class BucketListPage extends StatefulWidget {
  const BucketListPage({super.key});

  @override
  State<BucketListPage> createState() => _BucketListPageState();
}

class _BucketListPageState extends State<BucketListPage> {
  final TextEditingController _bucketController = TextEditingController();
  final List<String> _bucketList = [];

  void _addBucketItem() {
    String newItem = _bucketController.text.trim();
    if (newItem.isNotEmpty) {
      setState(() {
        _bucketList.add(newItem);
      });
      _bucketController.clear();
    }
  }

  @override
  void dispose() {
    _bucketController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor:
            Colors.orange, // Transparent untuk menunjukkan gradient
        elevation: 0, // Menghapus shadow
        centerTitle: true,
        title: const Text(
          'Bucket List',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tambah list baru:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _bucketController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan list baru',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addBucketItem,
                  child: const Text('Tambah'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Bucket List saya:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _bucketList.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada list, silahkan tambah baru!',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _bucketList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(_bucketList[index]),
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
