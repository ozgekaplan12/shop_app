import 'package:flutter/material.dart';

import '../widgets/order_summary.dart';

/// Final step of the basket flow: review the order and pay.
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key, required this.subtotal});

  final double subtotal;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _couponController = TextEditingController();

  String _shipping = 'standard';
  bool _saveAddress = true;
  bool _isSubmitting = false;
  String? _paymentError;

  @override
  void dispose() {
    _addressController.dispose();
    _couponController.dispose();
    super.dispose();
  }

  double get _shippingCost => _shipping == 'express' ? 9.90 : 0;

  double get _total => widget.subtotal + _shippingCost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Delivery address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Street and number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 8),
              CheckboxListTile(
                value: _saveAddress,
                onChanged: (v) => setState(() => _saveAddress = v ?? false),
                title: const Text('Save this address for next time'),
              ),

              const SizedBox(height: 24),
              const Text(
                'Shipping',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              RadioListTile<String>(
                value: 'standard',
                groupValue: _shipping,
                onChanged: (v) => setState(() => _shipping = v!),
                title: const Text('Standard — 3-5 days'),
                subtitle: const Text('Free'),
              ),
              RadioListTile<String>(
                value: 'express',
                groupValue: _shipping,
                onChanged: (v) => setState(() => _shipping = v!),
                title: const Text('Express — next day'),
                subtitle: const Text('\$9.90'),
              ),

              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _couponController,
                      decoration: const InputDecoration(
                        labelText: 'Coupon code',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    tooltip: 'button',
                    onPressed: _clearCoupon,
                  ),
                ],
              ),

              const SizedBox(height: 24),
              OrderSummary(subtotal: widget.subtotal, shipping: _shippingCost),

              if (_paymentError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    _paymentError!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              const SizedBox(height: 24),
              Semantics(
                label: 'Go back',
                button: true,
                child: GestureDetector(
                  onTap: _submitPayment,
                  child: Container(
                    height: 52,
                    alignment: Alignment.center,
                    color: Colors.blue.shade700,
                    child: Text(
                      _isSubmitting ? 'Processing...' : 'Pay \$${_total.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearCoupon() {
    _couponController.clear();
  }

  Future<void> _submitPayment() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
      _paymentError = null;
    });

    final result = await _charge(_total);

    setState(() {
      _isSubmitting = false;
      _paymentError = result ? null : 'Card declined. Please try a different card.';
    });
  }

  Future<bool> _charge(double amount) async => true;
}
