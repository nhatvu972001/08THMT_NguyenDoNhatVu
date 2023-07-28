import 'package:flutter/material.dart';
import 'package:baitaptuan2/ProductDetailScreen.dart';

List<String> productList = [
  'Sản phẩm 1',
  'Sản phẩm 2',
  'Sản phẩm 3',

];

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang Chủ'),
      ),
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            width: 390,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hồ Anh Khoa , 0850080025',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 20,
                ),
                buildRowLayout(),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'images/dart.png',
                  width: 120,
                ),
                Image.asset(
                  'images/flutter.png',
                  width: 120,
                ),
                Image.asset(
                  'images/android.jpg',
                  width: 120,
                ),


                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductListScreen()),
                      );
                    },
                    child: Text('Click Button!')),
              ],
            )),
      ),
    );
  }
}

Widget buildRowLayout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.green,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.orange,
        height: 100,
        width: 100,
      )
    ],
  );
}
class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách sản phẩm'),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Xử lý sự kiện khi người dùng nhấp vào sản phẩm
              onProductTapped(context,index);
            },
            child: ListTile(
              title: Text(productList[index]),
            ),
          );
        },
      ),
    );
  }

  void onProductTapped(BuildContext context, int index) {
    // Lấy tên sản phẩm tương ứng với chỉ số index trong danh sách sản phẩm
    String productName = productList[index];

    // Điều hướng sang màn hình chi tiết sản phẩm và chuyển tên sản phẩm qua
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(productName: productName),
      ),
    );
  }
}





