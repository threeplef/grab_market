import 'package:flutter/material.dart';

import '../data/model/product.dart';
import 'main_page.dart';

class ProductInfoPage extends StatelessWidget {
  ProductInfoPage(
      {Key? key,
      required this.item,
      required this.time,
      required this.typeItem})
      : super(key: key);

  Product item;
  final String time;
  final List<Product> typeItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios_new, color: Color(0xFF194050)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Image.asset('assets/icons/logo.png', width: 150),
          centerTitle: true,
          elevation: 2,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon:
                    const Icon(Icons.home, color: Color(0xFF194050), size: 30))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                        item.imageUrl.isEmpty
                            ? "./assets/images/products/no_image.jpg"
                            : item.imageUrl,
                        width: 300)),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child:
                      Text(item.itemName, style: const TextStyle(fontSize: 17)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(item.price.toString(),
                      style: const TextStyle(fontSize: 17)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 8.0, 20.0, 8.0),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/avatar.png', width: 30),
                      Text(item.seller),
                      const Spacer(),
                      Text(time),
                    ],
                  ),
                ),
                const Divider(),
                const Text("추천 상품", style: TextStyle(fontSize: 25)),
                SizedBox(
                  height: 310,
                  child: ListView.builder(
                      itemCount: typeItem.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final product = typeItem[index];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ItemCard(
                              item: product,
                              time: time,
                              typeItems: typeItem,
                            ));
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
