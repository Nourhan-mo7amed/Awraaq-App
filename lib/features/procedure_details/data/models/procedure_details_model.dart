import 'package:flutter/material.dart';

class ProcedureDetailsModel {
  final String id;
  final String title;
  final String description;
  bool isSaved;
  final int requiredDocsCount;
  final String officialFee;
  final int nearbyLocationsCount;
  final int aiTipsCount;
  final List<RequiredDocumentModel> requiredDocuments;
  final List<FeeChargeModel> feesAndCharges;
  final List<ProcedureLocationModel>? locations;

  List<ProcedureLocationModel> get safeLocations =>
      (locations != null && locations!.isNotEmpty)
          ? locations!
          : ProcedureLocationModel.defaultLocations;

  ProcedureDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    this.isSaved = false,
    required this.requiredDocsCount,
    required this.officialFee,
    required this.nearbyLocationsCount,
    required this.aiTipsCount,
    required this.requiredDocuments,
    required this.feesAndCharges,
    this.locations,
  });

  factory ProcedureDetailsModel.fromJson(Map<String, dynamic> json) {
    final rawDocs = json['required_documents'];
    List<RequiredDocumentModel> parsedDocs = [];

    if (rawDocs is List) {
      parsedDocs = rawDocs.map((e) {
        if (e is Map<String, dynamic>) {
          return RequiredDocumentModel.fromJson(e);
        }
        return RequiredDocumentModel(
          id: UniqueKey().toString(),
          title: e.toString(),
          description: 'Required document',
        );
      }).toList();
    } else if (rawDocs is String && rawDocs.trim().isNotEmpty) {
      parsedDocs = [
        RequiredDocumentModel(
          id: '1',
          title: rawDocs,
          description: 'Required document for this procedure',
        )
      ];
    }

    final rawLocations = json['locations'] as List<dynamic>?;
    List<ProcedureLocationModel> parsedLocations = [];
    if (rawLocations != null && rawLocations.isNotEmpty) {
      parsedLocations = rawLocations.map((e) {
        if (e is Map<String, dynamic>) {
          return ProcedureLocationModel.fromJson(e);
        }
        return ProcedureLocationModel(
          id: '0',
          title: 'Unknown Location',
          imageUrl: 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=400',
        );
      }).toList();
    }

    final feeStr = json['fees']?.toString() ?? json['officialFee']?.toString() ?? '0.00';
    final feeAmount = double.tryParse(feeStr) != null ? 'EGP $feeStr' : feeStr;

    final feesList = [
      FeeChargeModel(
        title: 'Official Procedure Fee',
        amount: feeAmount,
      )
    ];

    return ProcedureDetailsModel(
      id: json['id']?.toString() ?? '',
      title: json['name']?.toString() ?? json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      isSaved: json['is_saved'] as bool? ?? json['isSaved'] as bool? ?? false,
      requiredDocsCount: parsedDocs.length,
      officialFee: feeAmount,
      nearbyLocationsCount: parsedLocations.length,
      aiTipsCount: (json['ai_tips_count'] as num?)?.toInt() ?? 2,
      requiredDocuments: parsedDocs,
      feesAndCharges: feesList,
      locations: parsedLocations,
    );
  }

  static ProcedureDetailsModel get mockData => ProcedureDetailsModel(
        id: 'passport_renewal',
        title: 'Passport Renewal',
        description: 'Renew your Egyptian passport at official government',
        isSaved: false,
        requiredDocsCount: 4,
        officialFee: 'EGP 200',
        nearbyLocationsCount: 3,
        aiTipsCount: 4,
        requiredDocuments: [
          RequiredDocumentModel(
            id: '1',
            title: 'National ID Card',
            description: 'Current valid or expired ID Card',
          ),
          RequiredDocumentModel(
            id: '2',
            title: 'Old Passport',
            description: 'if it required',
          ),
          RequiredDocumentModel(
            id: '3',
            title: 'Passport Photo',
            description: 'White background',
          ),
          RequiredDocumentModel(
            id: '4',
            title: 'Payment Receipt',
            description: 'Official fee payment',
          ),
        ],
        feesAndCharges: [
          FeeChargeModel(
            title: 'Official Renewal Fee',
            amount: 'EGP 200.00',
          ),
          FeeChargeModel(
            title: 'Service Processing Charge',
            amount: 'EGP 150.00',
          ),
          FeeChargeModel(
            title: 'Optional Urgency Fee',
            amount: 'EGP 50.00',
          ),
          FeeChargeModel(
            title: 'stamps',
            amount: 'EGP 20.00',
          ),
        ],
        locations: ProcedureLocationModel.defaultLocations,
      );
}

class RequiredDocumentModel {
  final String id;
  final String title;
  final String description;

  RequiredDocumentModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory RequiredDocumentModel.fromJson(Map<String, dynamic> json) {
    return RequiredDocumentModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
    );
  }
}

class FeeChargeModel {
  final String title;
  final String amount;

  FeeChargeModel({
    required this.title,
    required this.amount,
  });

  factory FeeChargeModel.fromJson(Map<String, dynamic> json) {
    return FeeChargeModel(
      title: json['title']?.toString() ?? json['name']?.toString() ?? '',
      amount: json['amount']?.toString() ?? json['fee']?.toString() ?? '',
    );
  }
}

class ProcedureLocationModel {
  final String id;
  final String title;
  final String imageUrl;

  ProcedureLocationModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory ProcedureLocationModel.fromJson(Map<String, dynamic> json) {
    return ProcedureLocationModel(
      id: json['id']?.toString() ?? '',
      title: json['name']?.toString() ?? json['title']?.toString() ?? '',
      imageUrl: json['image_url']?.toString() ??
          json['imageUrl']?.toString() ??
          'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=400',
    );
  }

  static List<ProcedureLocationModel> get defaultLocations => [
        ProcedureLocationModel(
          id: '1',
          title: 'Civil Registry Office - Downtown',
          imageUrl:
              'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=400',
        ),
        ProcedureLocationModel(
          id: '2',
          title: 'Civil Registry Office - Downtown',
          imageUrl:
              'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=400',
        ),
        ProcedureLocationModel(
          id: '3',
          title: 'Civil Registry Office - Downtown',
          imageUrl:
              'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=400',
        ),
      ];
}

