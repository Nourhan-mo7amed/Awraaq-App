class GovernorateModel {
  final int id;
  final String name;

  const GovernorateModel({
    required this.id,
    required this.name,
  });

  factory GovernorateModel.fromJson(Map<String, dynamic> json) {
    return GovernorateModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class LocationNoteModel {
  final int id;
  final int? userId;
  final int? locationId;
  final String content;
  final String userName;
  final int rating;
  final String createdAt;
  final String userAvatarUrl;
  final String timeAgo;
  final bool isUserNote;

  const LocationNoteModel({
    required this.id,
    this.userId,
    this.locationId,
    required this.content,
    this.userName = '',
    this.rating = 0,
    this.createdAt = '',
    this.userAvatarUrl = '',
    this.timeAgo = '',
    this.isUserNote = true,
  });

  String get noteText => content;

  factory LocationNoteModel.fromJson(Map<String, dynamic> json) {
    return LocationNoteModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['user_id'] as num?)?.toInt(),
      locationId: (json['location_id'] as num?)?.toInt(),
      content: json['content']?.toString() ?? '',
      userName: json['user_name']?.toString() ?? '',
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at']?.toString() ?? '',
      userAvatarUrl: json['user_avatar_url']?.toString() ?? json['userAvatarUrl']?.toString() ?? '',
      timeAgo: json['time_ago']?.toString() ?? json['timeAgo']?.toString() ?? '',
      isUserNote: json['is_user_note'] as bool? ?? json['isUserNote'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'location_id': locationId,
      'content': content,
      'user_name': userName,
      'rating': rating,
      'created_at': createdAt,
      'user_avatar_url': userAvatarUrl,
      'time_ago': timeAgo,
      'is_user_note': isUserNote,
    };
  }
}

class LocationDetailsModel {
  final int id;
  final String name;
  final String address;
  final String city;
  final GovernorateModel? governorate;
  final String workingHours;
  final double latitude;
  final double longitude;
  final String status;
  final double? distance;
  final List<LocationNoteModel> notes;

  // Additional optional UI properties
  final String imageUrl;
  final double rating;
  final int reviewsCount;
  final String phoneNumber;
  final bool isFavorite;

  const LocationDetailsModel({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    this.governorate,
    required this.workingHours,
    required this.latitude,
    required this.longitude,
    required this.status,
    this.distance,
    required this.notes,
    this.imageUrl = 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=1200&auto=format&fit=crop',
    this.rating = 4.2,
    this.reviewsCount = 0,
    this.phoneNumber = '',
    this.isFavorite = false,
  });

  String get category => governorate?.name ?? city;

  factory LocationDetailsModel.fromJson(Map<String, dynamic> json) {
    final parsedNotes = (json['notes'] as List<dynamic>?)
            ?.map((e) => LocationNoteModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];

    return LocationDetailsModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      city: json['city']?.toString() ?? '',
      governorate: json['governorate'] != null && json['governorate'] is Map<String, dynamic>
          ? GovernorateModel.fromJson(json['governorate'] as Map<String, dynamic>)
          : null,
      workingHours: json['working_hours']?.toString() ?? json['workingHours']?.toString() ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      status: json['status']?.toString() ?? 'inactive',
      distance: (json['distance'] as num?)?.toDouble(),
      notes: parsedNotes,
      imageUrl: json['image_url']?.toString() ??
          json['imageUrl']?.toString() ??
          'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=1200&auto=format&fit=crop',
      rating: (json['rating'] as num?)?.toDouble() ?? 4.2,
      reviewsCount: (json['reviews_count'] as num?)?.toInt() ?? parsedNotes.length,
      phoneNumber: json['phone_number']?.toString() ?? json['phoneNumber']?.toString() ?? json['phone']?.toString() ?? '',
      isFavorite: json['is_favorite'] as bool? ?? json['isFavorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'city': city,
      'governorate': governorate?.toJson(),
      'working_hours': workingHours,
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
      'distance': distance,
      'notes': notes.map((n) => n.toJson()).toList(),
      'image_url': imageUrl,
      'rating': rating,
      'reviews_count': reviewsCount,
      'phone_number': phoneNumber,
      'is_favorite': isFavorite,
    };
  }

  static LocationDetailsModel get mockData => LocationDetailsModel(
        id: 2,
        name: 'Elbertburgh',
        address: '57197 Rachael Squares Suite 004\nBaileyville, WV 60818',
        city: 'North Kathleenfurt',
        governorate: const GovernorateModel(id: 27, name: 'Ismailia'),
        workingHours: '14:22:47 - 17:50:10',
        latitude: 86.42074,
        longitude: 69.434946,
        status: 'inactive',
        distance: null,
        notes: [
          const LocationNoteModel(
            id: 31,
            userId: 121,
            locationId: 2,
            content: 'tessssssssssssssssssssssssssssssssssst',
            userName: 'Ahmed Fathi',
            rating: 4,
            createdAt: '2026-08-09T12:10:36.000000Z',
            userAvatarUrl: 'https://i.pravatar.cc/150?img=11',
            timeAgo: '2 days ago',
          ),
        ],
      );
}
