import 'package:flutter/material.dart';

/// Order tracking. Shows the shipment stages and lets the customer cancel.
class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key, required this.orderId, required this.stage});

  final String orderId;
  final int stage;

  static const _stages = ['Packed', 'Shipped', 'Out for delivery', 'Delivered'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Track order')),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/map.png', width: double.infinity, height: 160),
            const SizedBox(height: 16),
            Text(
              'Order $orderId',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              'Estimated delivery 4 October',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
            ),
            const SizedBox(height: 24),
            for (var i = 0; i < _stages.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      i <= stage ? Icons.check_circle : Icons.circle_outlined,
                      color: i <= stage ? Colors.green : Colors.grey,
                    ),
                    const SizedBox(width: 12),
                    Text(_stages[i], style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.share_outlined),
                  onPressed: _shareTracking,
                ),
                const Spacer(),
                Semantics(
                  label: 'Track order',
                  button: true,
                  child: GestureDetector(
                    onTap: _cancelOrder,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade700,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Cancel order',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void _shareTracking() {}

  static void _cancelOrder() {}
}
