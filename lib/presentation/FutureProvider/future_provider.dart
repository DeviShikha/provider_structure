Future<String> fetchData() async {
  await Future.delayed(const Duration(seconds: 3));
  return "Data Loaded Successfully";
}