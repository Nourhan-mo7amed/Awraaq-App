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
      id: json['id']?.toString() ?? '',
      userName: json['userName'] ?? json['user_name'] ?? 'Anonymous',
      userAvatarUrl: json['userAvatarUrl'] ?? json['avatar'] ?? '',
      timeAgo: json['timeAgo'] ?? json['created_at'] ?? 'Recently',
      rating: (json['rating'] as num?)?.toDouble() ?? 4.0,
      noteText: json['noteText'] ?? json['content'] ?? json['text'] ?? '',
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
        phoneNumber: '16528',
        isFavorite: false,
        notes: [
          LocationNoteModel(
            id: 'note_1',
            userName: 'Ahmed Fathi',
            userAvatarUrl: 'https://i.pravatar.cc/150?img=11',
            timeAgo: '2 days ago',
            rating: 4.0,
            noteText:
                'The office was very crowded in the morning. I recommend going early.',
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
    // 1. Name
    final String parsedName = json['name']?.toString() ?? 'Government Center';

    // 2. Category / Governorate / City
    String parsedCategory = '';
    if (json['governorate'] is Map && json['governorate']['name'] != null) {
      parsedCategory = json['governorate']['name'].toString();
    } else if (json['city'] != null && json['city'].toString().isNotEmpty) {
      parsedCategory = json['city'].toString();
    } else if (json['category'] != null && json['category'].toString().isNotEmpty) {
      parsedCategory = json['category'].toString();
    } else {
      parsedCategory = 'Government Service';
    }

    // 3. Image URL (fallback if backend doesn't send image)
    final String rawImage = json['imageUrl']?.toString() ?? json['image']?.toString() ?? '';
    final String parsedImageUrl = rawImage.isNotEmpty
        ? rawImage
        : 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=1200&auto=format&fit=crop';

    // 4. Status (active/inactive or is_open_now)
    final String rawStatus = json['status']?.toString() ?? '';
    final bool isOpenNow = json['is_open_now'] == true;
    final String parsedStatus = (rawStatus.toLowerCase() == 'active' || isOpenNow) ? 'Open' : 'Closed';

    // 5. Address & City
    final String rawAddress = json['address']?.toString() ?? '';
    final String city = json['city']?.toString() ?? '';
    final String fullAddress = rawAddress.isNotEmpty
        ? (city.isNotEmpty && !rawAddress.contains(city) ? '$rawAddress, $city' : rawAddress)
        : 'Cairo, Egypt';

    // 6. Working hours (backend field key: working_hours)
    final String rawWorkingHours = json['working_hours']?.toString() ?? json['workingHours']?.toString() ?? '';
    final String workingDays = json['working_days']?.toString() ?? 'Sun - Thu';
    final String parsedWorkingHours = rawWorkingHours.isNotEmpty
        ? '$workingDays ($rawWorkingHours)'
        : 'Sunday - Thursday (8:00 AM - 4:00 PM)';

    // 7. Phone Number (backend field key: phone)
    final String rawPhone = json['phone']?.toString() ?? json['phoneNumber']?.toString() ?? '';
    final String parsedPhone = (rawPhone.isNotEmpty && rawPhone != 'null')
        ? rawPhone
        : '16528 (Hotline)';

    // 8. Rating & Reviews count
    final double rating = (json['rating'] as num?)?.toDouble() ?? 4.2;
    final int reviewsCount = (json['reviewsCount'] as num?)?.toInt() ?? (json['reviews_count'] as num?)?.toInt() ?? 128;

    // 9. Notes (Fallback to default sample notes if API doesn't return notes list)
    List<LocationNoteModel> parsedNotes = [];
    if (json['notes'] is List && (json['notes'] as List).isNotEmpty) {
      parsedNotes = (json['notes'] as List)
          .map((n) => LocationNoteModel.fromJson(n as Map<String, dynamic>))
          .toList();
    } else {
      parsedNotes = [
        const LocationNoteModel(
          id: 'n1',
          userName: 'Ahmed Fathi',
          userAvatarUrl: 'https://i.pravatar.cc/150?img=11',
          timeAgo: '2 days ago',
          rating: 4.0,
          noteText: 'الفرع يفتح في المواعيد المحددة والتعامل سريع وممتاز.',
          isUserNote: true,
        ),
        const LocationNoteModel(
          id: 'n2',
          userName: 'Sara H',
          userAvatarUrl: 'https://i.pravatar.cc/150?img=5',
          timeAgo: '1 week ago',
          rating: 4.5,
          noteText: 'أنصح بالحضور مبكراً لتفادي الازدحام.',
          isUserNote: true,
        ),
      ];
    }

    return LocationDetailsModel(
      id: json['id']?.toString() ?? '1',
      name: parsedName,
      category: parsedCategory,
      imageUrl: parsedImageUrl,
      status: parsedStatus,
      rating: rating,
      reviewsCount: reviewsCount,
      address: fullAddress,
      workingHours: parsedWorkingHours,
      phoneNumber: parsedPhone,
      isFavorite: json['isFavorite'] == true,
      notes: parsedNotes,
    );
  }
}
