class LocationNoteModel {
  final String id;
  final String userName;
  final String userAvatarUrl;
  final String timeAgo;
  final double rating;
  final String noteText;
  final bool isUserNote;

  const LocationNoteModel({
    required this.id,
    required this.userName,
    required this.userAvatarUrl,
    required this.timeAgo,
    required this.rating,
    required this.noteText,
    this.isUserNote = true,
  });

  factory LocationNoteModel.fromJson(Map<String, dynamic> json) {
  return LocationNoteModel(
    id: json['id'].toString(),
    userName: json['userName'] ?? '',
    userAvatarUrl: json['userAvatarUrl'] ?? '',
    timeAgo: json['timeAgo'] ?? '',
    rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    noteText: json['noteText'] ?? '',
    isUserNote: json['isUserNote'] ?? false,
  );
}
}

class LocationDetailsModel {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final String status;
  final double rating;
  final int reviewsCount;
  final String address;
  final String workingHours;
  final String phoneNumber;
  final bool isFavorite;
  final List<LocationNoteModel> notes;

  const LocationDetailsModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.status,
    required this.rating,
    required this.reviewsCount,
    required this.address,
    required this.workingHours,
    required this.phoneNumber,
    this.isFavorite = false,
    required this.notes,
  });

  static LocationDetailsModel get mockData => const LocationDetailsModel(
        id: 'loc_001',
        name: 'Civil Registry Office - Downtown',
        category: 'Government Service',
        imageUrl:
            'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=1200&auto=format&fit=crop',
        status: 'Open',
        rating: 4.2,
        reviewsCount: 128,
        address: 'Al Tahrir St., Downtown, Cairo',
        workingHours: 'Sunday-Thursday\n8:00 AM - 4:00 PM',
        phoneNumber: '050 123 4567',
        isFavorite: false,
        notes: [
          LocationNoteModel(
            id: 'note_1',
            userName: 'Ahmed Fathi',
            userAvatarUrl: 'https://i.pravatar.cc/150?img=11',
            timeAgo: '2 days ago',
            rating: 4.0,
            noteText:
                'The office was very crowded in the morning. I recommend going early',
            isUserNote: true,
          ),
          LocationNoteModel(
            id: 'note_2',
            userName: 'Sara H',
            userAvatarUrl: 'https://i.pravatar.cc/150?img=5',
            timeAgo: '1 week ago',
            rating: 4.5,
            noteText:
                'Great and helpful staff. The process was quick.',
            isUserNote: true,
          ),
        ],
      );

      factory LocationDetailsModel.fromJson(Map<String, dynamic> json) {
  return LocationDetailsModel(
    id: json['id'].toString(),
    name: json['name'] ?? '',
    category: json['category'] ?? '',
    imageUrl: json['imageUrl'] ?? '',
    status: json['status'] ?? '',
    rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    reviewsCount: json['reviewsCount'] ?? 0,
    address: json['address'] ?? '',
    workingHours: json['workingHours'] ?? '',
    phoneNumber: json['phoneNumber'] ?? '',
    isFavorite: json['isFavorite'] ?? false,
    notes: (json['notes'] as List?)
            ?.map((note) => LocationNoteModel.fromJson(note))
            .toList() ??
        [],
  );
}

}
