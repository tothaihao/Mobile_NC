import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double averageRating = 4.0;
  double userRating = 3.0;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // 👈 xử lý quay lại
        ),
        title: const Text('Chi tiết sản phẩm'),
        backgroundColor: Colors.brown[300],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'https://noithatcaphe.vn/images/2022/07/16/bac-siu-cafe-2.jpg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Name
                  Text(
                    'Bạc Xỉu Đá',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Text(
                    'Nếu Phin Sữa Đá dành cho các bạn đam mê vị đậm đà, thì Bạc Xỉu Đá là một sự lựa chọn nhẹ "đô" cà phê nhưng vẫn thơm ngon, chất lừ không kém!',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 16),
                  // Price + Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '29000₫',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: averageRating,
                            itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
                            itemCount: 5,
                            itemSize: 20,
                          ),
                          SizedBox(width: 8),
                          Text('(${averageRating.toStringAsFixed(2)})'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Add to cart button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[300],
                      minimumSize: Size(double.infinity, 48),
                    ),
                    onPressed: () {},
                    child: Text("THÊM SẢN PHẨM"),
                  ),
                  const SizedBox(height: 20),
                  // Comment Section
                  Text(
                    'T',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: 4.0,
                        itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 20,
                      ),
                      SizedBox(width: 8),
                      Text('rất ngon'),
                    ],
                  ),
                  Divider(height: 30),
                  // Write review
                  Text(
                    'Viết đánh giá',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  RatingBar.builder(
                    initialRating: userRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 28,
                    itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {
                      setState(() {
                        userRating = rating;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: "Hãy viết đánh giá của bạn cho sản phẩm...",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // handle submit
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[200],
                      minimumSize: Size(double.infinity, 48),
                    ),
                    child: Text("LƯU ĐÁNH GIÁ"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
