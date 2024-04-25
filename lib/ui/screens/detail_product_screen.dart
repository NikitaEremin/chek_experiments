import 'package:chek_experiments/data/models/product.dart';
import 'package:chek_experiments/providers/nomenclature_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailProductScreen extends StatefulWidget {
  final int index;

  const DetailProductScreen({super.key, required this.index});

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
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _gtinController = TextEditingController();
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
    NomenclatureProvider nomenclatureProvider =
        context.watch<NomenclatureProvider>();
    Product product = nomenclatureProvider.products[widget.index];
    _nameController = TextEditingController(text: product.name);
    _priceController = TextEditingController(text: product.price.toString());
    _gtinController = TextEditingController(text: product.gtin);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerRight,
          child: FilledButton(
            onPressed: () {
              nomenclatureProvider.edit(
                widget.index,
                Product(
                    name: _nameController.text,
                    price: double.parse(_priceController.text),
                    gtin: _gtinController.text,
                    image: product.image),
              );
              Navigator.of(context).pop();
            },
            child: const Text('Сохранить'),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                nomenclatureProvider.delete(product);
                // dispose();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 150, child: product.image),
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
            onPressed: () {
              _nameController.text = '';
            },
            icon: const Icon(Icons.clear))
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
            onPressed: () {
              _priceController.text = '';
            },
            icon: const Icon(Icons.clear))
      ],
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
        IconButton(
            onPressed: () {
              _gtinController.text = '';
            },
            icon: const Icon(Icons.qr_code_scanner))
      ],
    );
  }
}
