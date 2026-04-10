import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latihan1/ui/produk_detail.dart';

class Produkform extends StatefulWidget {
  const Produkform({super.key});

  @override
  State<Produkform> createState() => _Produkformstate();
}

class _Produkformstate extends State<Produkform> {
  final _kodeProdukController = TextEditingController();
  final _namaProdukController = TextEditingController();
  final _hargaProdukController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Produk')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Kode Produk"),
              controller: _kodeProdukController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Nama Produk"),
              controller: _namaProdukController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Harga Produk"),
              controller: _hargaProdukController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Simpan'),
              onPressed: () async {
                try {
                  await FirebaseFirestore.instance.collection('produk').add({
                    'kodeProduk': _kodeProdukController.text,
                    'namaProduk': _namaProdukController.text,
                    'harga': int.parse(_hargaProdukController.text),
                  });

                  if (!mounted) return;

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProdukDetail(
                        kodeProduk: _kodeProdukController.text,
                        namaProduk: _namaProdukController.text,
                        harga: int.parse(_hargaProdukController.text),
                      ),
                    ),
                  );
                } catch (e) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Terjadi kesalahan: $e")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
