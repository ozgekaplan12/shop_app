import 'package:flutter/material.dart';

/// Subtotal, shipping and total, shown above the pay button.
class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.subtotal, required this.shipping});

  final double subtotal;
  final double shipping;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          _row(context, 'Subtotal', subtotal),
          _row(context, 'Shipping', shipping),
          const Divider(),
          _row(context, 'Total', subtotal + shipping, emphasise: true),
          const SizedBox(height: 4),
          Text(
            'VAT included where applicable',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }

  Widget _row(
    BuildContext context,
    String label,
    double amount, {
    bool emphasise = false,
  }) {
    final style = TextStyle(
      fontSize: emphasise ? 18 : 14,
      fontWeight: emphasise ? FontWeight.bold : FontWeight.normal,
      color: Colors.black87,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text('\$${amount.toStringAsFixed(2)}', style: style),
        ],
      ),
    );
  }
}
