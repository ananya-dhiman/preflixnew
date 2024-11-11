class Objs {
  final int id;
  final String name;
  final String summary;
  final DateTime premiered;
  final String image; // Only store image.original as a string
  final List<String> genres;


  const Objs({
    required this.id,
    required this.name,
    required this.summary,
    required this.premiered,
    required this.image,
    required this.genres,
  });

  factory Objs.fromJson(Map<String, dynamic> json) {
    final show=json['show'];
    if (json['show'] == null) {
      throw ArgumentError('Missing : show');
    }
     if (show['id'] == null) {
       throw ArgumentError('Missing required field: id');
    }
    if (show['name'] == '') {
      throw ArgumentError('Missing required field: name');
    }
    if (show['summary'] == '') {
      throw ArgumentError('Missing required field: summary');
    }
    // if (show['premiered'] == null) {
    //   throw ArgumentError('Missing required field: premiered');
    // }
    
    return Objs(

      
      id: show['id'] ?? 0,
      name: show['name'] ?? 'No Name',
      summary: show['summary'] ?? 'No Summary',
      premiered: DateTime.parse(show['premiered'] ?? '2000-01-01'),
      image: show['image']?['original'] ?? '',
      genres: List<String>.from(show['genres'] ?? []),//toString
      
    
        );
  }
}

