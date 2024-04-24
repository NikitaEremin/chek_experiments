import 'package:chek_experiments/data/models/product.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatefulWidget {
  final Product product;

  const DetailProductScreen({super.key, required this.product});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _gtinController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _priceController = TextEditingController(text: widget.product.price.toString());
    _gtinController = TextEditingController(text: widget.product.gtin);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _gtinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Информация о товаре'),
        backgroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.delete))],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  child: widget.product.image,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Поменять изображение')),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NameField(nameController: _nameController),
                    const SizedBox(height: 16),
                    PriceField(priceController: _priceController),
                    const SizedBox(height: 16),
                    BarcodeField(gtinController: _gtinController),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class BarcodeField extends StatelessWidget {
  const BarcodeField({
    super.key,
    required TextEditingController gtinController,
  }) : _gtinController = gtinController;

  final TextEditingController _gtinController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            controller: _gtinController,
            decoration: const InputDecoration(
              labelText: 'Штрихкод',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
        IconButton(onPressed: () {_gtinController.text = '';}, icon: const Icon(Icons.qr_code_scanner))
      ],
    );
  }
}

class PriceField extends StatelessWidget {
  const PriceField({
    super.key,
    required TextEditingController priceController,
  }) : _priceController = priceController;

  final TextEditingController _priceController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _priceController,
            decoration: const InputDecoration(
              labelText: 'Цена',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
        IconButton(
            onPressed: () {_priceController.text = '';}, icon: const Icon(Icons.clear))
      ],
    );
  }
}

class NameField extends StatelessWidget {
  const NameField({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Наименование',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
        IconButton(
            onPressed: () {_nameController.text = '';}, icon: const Icon(Icons.clear))
      ],
    );
  }
}
