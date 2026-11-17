enum FailureCodes {
  noInternet,
  timeout,
  server,
  notFound,
  unauthorized,
  permission,
  validation,
  noResults,
  featureUnsupported,
  unknown,
}

enum BlocStatus { initial, loading, loaded, failure }

enum Currency {
  INR("₹", 1000, 500000),
  USD("\$", 10, 10000);

  const Currency(this.sign, this.min, this.max);

  final String sign;
  final int min;
  final int max;
}
