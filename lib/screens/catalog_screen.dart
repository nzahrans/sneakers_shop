import 'package:flutter/material.dart';
// Import widget background & shoe card
import 'package:sneakers_shop/widgets/gradient_background.dart';
import 'package:sneakers_shop/widgets/shoe_card.dart';
import 'detail_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  // Data Sepatu
  final List<Map<String, String>> shoes = const [
    {
      "name": "New Balance 530 White Natural",
      "price": "Rp 649.000",
      "image": "assets/images/sepatu1.jpeg"
    },
    {
      "name": "Adds Samba OG Black White",
      "price": "Rp 115.000",
      "image": "assets/images/sepatu2.jpeg"
    },
    {
      "name": "Puma Palermo Alpine Snow White",
      "price": "Rp 595.000",
      "image": "assets/images/sepatu3.jpeg"
    },
    {
      "name": "Kanky Story Kogyuku",
      "price": "Rp 258.000",
      "image": "assets/images/sepatu4.jpeg"
    },
    {
      "name": "Kanky Story Nobeta",
      "price": "Rp 358.000",
      "image": "assets/images/sepatu5.jpeg"
    },
    {
      "name": "Adidas K 74 IG8952",
      "price": "Rp 749.000",
      "image": "assets/images/sepatu6.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Logic Responsif
    var screenWidth = MediaQuery.of(context).size.width;
    int gridCount = screenWidth > 600 ? 3 : 2;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
            "Katalog Sepatu",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        // Tombol back warna putih agar terlihat di background biru
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // MENGGUNAKAN CUSTOM WIDGET KE-2 (GradientBackground)
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 10, right: 10, bottom: 10),
          child: GridView.builder(
            itemCount: shoes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              // Catatan: Saya menghapus widget 'Card' pembungkus di sini
              // agar shadow tidak dobel (karena ShoeCard sudah punya shadow).
              // Langsung GestureDetector -> ShoeCard
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        name: shoes[index]['name']!,
                        price: shoes[index]['price']!,
                        image: shoes[index]['image']!,
                      ),
                    ),
                  );
                },
                child: ShoeCard(
                  namaSepatu: shoes[index]['name']!,
                  harga: shoes[index]['price']!,
                  gambarUrl: shoes[index]['image']!,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}