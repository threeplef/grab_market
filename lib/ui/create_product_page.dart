import 'package:flutter/material.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _nameTextController = TextEditingController();
  final _priceTextController = TextEditingController();
  final _sellerTextController = TextEditingController();
  final _imageUrlTextController = TextEditingController();

  @override
  void dispose() {
    _nameTextController.dispose();
    _priceTextController.dispose();
    _sellerTextController.dispose();
    _imageUrlTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('assets/icons/logo.png', width: 150),
          centerTitle: true,
          elevation: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "상품 등록하기",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              createTextField(
                context: context,
                controller: _nameTextController,
                title: "상품명",
              ),
              createTextField(
                context: context,
                controller: _priceTextController,
                title: "상품 가격",
              ),
              createTextField(
                context: context,
                controller: _sellerTextController,
                title: "판매자",
              ),
              createTextField(
                context: context,
                controller: _imageUrlTextController,
                title: "이미지 주소",
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF194050),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "등록하기",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row createTextField({
    required BuildContext context,
    required String title,
    required TextEditingController controller,
  }) {
    return Row(
      children: [
        Text(title),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: 250,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: title,
                isCollapsed: true,
                contentPadding: const EdgeInsets.all(10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
