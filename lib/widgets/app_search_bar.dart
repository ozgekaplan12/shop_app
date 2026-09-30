import 'package:flutter/material.dart';

/// Search field shown at the top of the catalogue.
class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, required this.controller, this.onSubmitted});

  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Search products',
          prefixIcon: const Icon(Icons.search, semanticLabel: 'Search'),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'Clear the search field',
            onPressed: controller.clear,
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
