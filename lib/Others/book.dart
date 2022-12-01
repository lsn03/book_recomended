// ignore_for_file: non_constant_identifier_names

class Profile {
  final String id_book;
  final String author_book;
  final String book_name;
  final int year;
  final String genre_book;
  final int age_permission;
  final String annotation_book;
  final String book_image;


  Profile({
    required this.id_book,
    required this.author_book,
    required this.book_name,
    required this.year,
    required this.genre_book,
    required this.age_permission,
    required this.annotation_book,
    required this.book_image,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id_book: json['id_book'],
      author_book: json['author_book'],
      book_name: json['book_name'],
      year: json['year'],
      genre_book: json['genre_book'],
      age_permission: json['age_permission'],
      annotation_book: json['annotation_book'],
      book_image: json['book_image'],
    );
  }
}