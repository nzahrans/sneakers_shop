import 'package:flutter/material.dart';

class ShoeCard extends StatelessWidget {
  // Variabel untuk menampung data yang dikirim dari Katalog
  final String namaSepatu;
  final String harga;
  final String gambarUrl;

  const ShoeCard({
    super.key,
    required this.namaSepatu,
    required this.harga,
    required this.gambarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(128, 128, 128, 0.3), // grey dengan transparansi
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Gambar
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: gambarUrl.startsWith('assets/')
                  ? Image.asset(
                      gambarUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      gambarUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
          ),

          // Bagian Teks (Nama & Harga)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namaSepatu,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  harga,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}