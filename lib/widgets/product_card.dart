import 'package:flutter/material.dart';

/// A single product in the catalogue grid.
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.inStock,
    this.onTap,
  });

  final String title;
  final String price;
  final String imageUrl;
  final bool inStock;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.zero,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  semanticLabel: 'product',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              Text(
                'Free delivery over \$50',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: inStock ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    inStock ? 'In stock' : 'Out of stock',
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: onTap,
                child: const Text('View details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
