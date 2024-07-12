class Product {
  final String id;
  final String name;
  final String label;
  final double price;
  final String image;
  final String rating;
  final String duration;
  int quantity;
  bool isAdded;

  Product({
    required this.id, required this.name,required this.label, required this.price,
    required this.image,required this.rating, required this.duration,this.quantity=0,this.isAdded=false
  });
  factory Product.fromJson(Map<String, dynamic> data) => Product(
    id: data['id'],
    name: data['name'],
    label: data['label'],
    price: data['price'],
    image: data['image'],
    rating: data['rating'],
    duration: data['duration'],

  );
  Map<String, dynamic> toMap() => {
  'id': id,
  'name':  name,
  'label' : label,
  'price': price,
  'image': image,
  'rating': rating, 
  'duration': duration

};
}