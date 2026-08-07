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
}

class FeeChargeModel {
  final String title;
  final String amount;

  FeeChargeModel({
    required this.title,
    required this.amount,
  });
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
