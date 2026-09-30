# shop_app

A small Flutter storefront used as a fixture for accessibility scanning.

Five files: a checkout screen with an address form, shipping options and a coupon
field; a product card; an order summary; an account screen; a search bar.

**Some of this code is deliberately inaccessible.** It is here to be scanned, not
copied. The defects are the ordinary kind — a label that no longer matches the
action it sits on, text at a contrast ratio that fails WCAG AA, a tooltip that
says nothing — written the way they actually reach production rather than as
obvious mistakes.

Other parts are written correctly on purpose, so a scanner that reports them is
reporting noise.
