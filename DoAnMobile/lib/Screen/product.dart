import 'package:flutter/material.dart';
import 'package:do_an_mobile_nc/Layout/masterlayout.dart';
import 'package:do_an_mobile_nc/Screen/product_detail.dart';
import 'package:do_an_mobile_nc/Screen/search_screen.dart'; // Import the new search screen

class ProductListScreen extends StatefulWidget {
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String selectedCategory = 'Tất cả';

  final List<String> categories = [
    'Tất cả',
    'Trà Sữa',
    'Cà Phê',
    'Bánh Ngọt',
    'Đá Xay',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Bạc xỉu',
      'price': 40000,
      'image': 'https://noithatcaphe.vn/images/2022/07/16/bac-siu-cafe-2.jpg',
      'rating': 4.9,
    },
    {
      'name': 'Freeze sô-cô-la',
      'price': 55000,
      'image': 'https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/New_product/HLC_New_logo_5.1_Products__FREEZE_CHOCO.jpg',
      'rating': 4.8,
    },
    {
      'name': 'Trà sen vàng',
      'price': 55000,
      'image': 'https://bizweb.dktcdn.net/100/487/455/products/tra-sen-vang-cu-nang-highlands-coffee-1698985351581.jpg?v=1724205201147',
      'rating': 4.6,
    },
    {
      'name': 'Bánh flan caramen',
      'price': 36000,
      'image': 'https://example.com/banh_flan_caramel.jpg', // Replace with actual image URL
      'rating': 4.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      currentIndex: 1,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sản phẩm',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.search, color: Colors.brown),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchScreen()),
                        );
                      },
                    ),
                    DropdownButton<String>(
                      value: selectedCategory,
                      items: categories.map((cat) {
                        return DropdownMenuItem<String>(
                          value: cat,
                          child: Text(cat, style: TextStyle(color: Colors.grey)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                      underline: SizedBox(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // Product grid
                  Expanded(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('<1, 2, 3>', style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ),
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailPage()),
        );
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