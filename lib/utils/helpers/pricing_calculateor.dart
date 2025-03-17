class TPricingCalculator {
  // ---Calculate price based on tax and shippping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    return productPrice + taxAmount + shippingCost;
  }
  // ---Calculate shippping cost

  static String calculateShippingCost(String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }
  // ---Calculate tax

  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // lookup the tax rate for the given location from a database or API
    // Return tha appropriate tax rate based on the location
    return 0.10; // Example tax rate of 10%
  }

  static double getShippingCost(String location) {
    // lookup the shipping cost for the given location from a database or API
    // Return the appropriate shipping cost based on the location
    return 5.00; // Example shipping cost of $5.00
  }
  // ---Calculate total price
// return cart.items.map((e) => e.price).fold(0(previous price, current price) => previousPrice + (currentPrice ?? 0));
}
