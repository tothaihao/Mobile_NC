import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> products = [
    {'name': 'Bạc xỉu', 'price': 40000, 'image': 'https://noithatcaphe.vn/images/2022/07/16/bac-siu-cafe-2.jpg', 'rating': 4.9},
    {'name': 'Freeze sô-cô-la', 'price': 55000, 'image': 'https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/New_product/HLC_New_logo_5.1_Products__FREEZE_CHOCO.jpg', 'rating': 4.8},
    {'name': 'Trà sen vàng', 'price': 55000, 'image': 'https://bizweb.dktcdn.net/100/487/455/products/tra-sen-vang-cu-nang-highlands-coffee-1698985351581.jpg?v=1724205201147', 'rating': 4.6},
    {'name': 'Bánh flan caramen', 'price': 36000, 'image': 'https://example.com/banh_flan_caramel.jpg', 'rating': 4.5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Coffee shop', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Tìm sản phẩm',
                prefixIcon: Icon(Icons.search, color: Colors.brown),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
                children: products.map((product) {
                  return ProductCard(product: product);
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text('<1, 2, 3>', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to product detail page
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.brown.shade100),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product['image'],
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              product['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${product['price'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')} đ',
              style: TextStyle(color: Colors.green),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text(
                      '${product['rating']}',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Icon(Icons.favorite_border, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}