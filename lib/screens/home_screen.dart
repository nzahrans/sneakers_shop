import 'package:flutter/material.dart';
// Import widget baru dan halaman catalog
import 'package:sneakers_shop/widgets/gradient_background.dart';
import 'catalog_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KicksApp Store"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      // MENGGUNAKAN CUSTOM WIDGET KE-2 (GradientBackground)
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Pastikan gambar banner.png ada di folder assets/images/
              Image.asset('assets/images/banner.png', height: 300),
              const SizedBox(height: 20),

              const Text(
                "Temukan Sepatu Impianmu",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              const Text(
                "Koleksi terbaik dengan harga termurah.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF2980B9),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CatalogScreen()),
                    );
                  },
                  child: const Text(
                      "Belanja Sekarang",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}