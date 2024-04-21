import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class NomenclatureScreen extends StatelessWidget {
  const NomenclatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Товары'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SearchWidget(theme: theme, screenSize: screenSize),
            Row(children: [Text('Категории', style: theme.textTheme.headlineMedium,)],),
          ],
        ),
      ),
    );
  }
}



class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.theme,
    required this.screenSize,
  });

  final ThemeData theme;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: theme.colorScheme.surfaceVariant,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  hintText: 'Поиск в номенклатуре'
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              style: IconButton.styleFrom(
                  minimumSize: const Size(62, 62),
                  backgroundColor: theme.colorScheme.surfaceVariant,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              onPressed: () {},
              icon: const Icon(Icons.document_scanner),
            ),
          ),
        ],
      ),
    );
  }
}
