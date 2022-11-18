import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grab_market/ui/create_product_page.dart';
import 'package:provider/provider.dart';

import '../data/model/product.dart';
import 'main_view_model.dart';
import 'product_info_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List bannerItems = [
    'assets/banners/banner1.png',
    'assets/banners/banner2.png'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('assets/icons/logo.png', width: 150),
          centerTitle: true,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 110,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 100,
                    autoPlay: true,
                  ),
                  items: bannerItems.map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(url, fit: BoxFit.cover),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Row(
                  children: [
                    const Text(
                      "판매되는 상품들",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateProductPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF194050),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "상품 등록",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: List.generate(
                    viewModel.productList.length,
                    (index) {
                      final item = viewModel.productList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: ItemCard(
                          item: item,
                          time: '$index일전',
                          typeItems: viewModel.productList
                              .where((element) =>
                                  element.type == item.type &&
                                  element.itemId != item.itemId)
                              .toList(),
                        ),
                      );
                    },
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

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key,
      required this.item,
      required this.time,
      required this.typeItems})
      : super(key: key);

  final Product item;
  final String time;
  final List<Product> typeItems;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductInfoPage(
                    item: item,
                    time: time,
                    typeItem: typeItems,
                  )),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      image: DecorationImage(
                        image: AssetImage(item.imageUrl == ""
                            ? "./assets/images/products/no_image.jpg"
                            : item.imageUrl),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
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
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Row(
                  children: [
                    Image.asset('assets/icons/avatar.png', width: 30),
                    Text(item.seller),
                    const Spacer(),
                    Text(time),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
