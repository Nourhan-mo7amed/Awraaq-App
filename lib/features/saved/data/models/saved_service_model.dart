class SavedServiceModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final String savedDate;

  SavedServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.savedDate,
  });

  static List<SavedServiceModel> get mockServices => [
        SavedServiceModel(
          id: '1',
          title: 'Business License Renewal',
          description:
              'Renew your annual commercial license with the Ministry of Commerce.',
          category: 'Commerce & Trade',
          savedDate: 'Saved 22 Jul 2026',
        ),
        SavedServiceModel(
          id: '2',
          title: 'ID Renewal',
          description:
              'Renew your annual commercial license with the Ministry of Commerce.',
          category: 'Commerce & Trade',
          savedDate: 'Saved 22 Jul 2026',
        ),
        SavedServiceModel(
          id: '3',
          title: 'Passport Renewal',
          description:
              'Renew your annual commercial license with the Ministry of Commerce.',
          category: 'Commerce & Trade',
          savedDate: 'Saved 22 Jul 2026',
        ),
        SavedServiceModel(
          id: '4',
          title: 'Driving License Renewal',
          description:
              'Renew your annual commercial license with the Ministry of Commerce.',
          category: 'Commerce & Trade',
          savedDate: 'Saved 22 Jul 2026',
        ),
      ];
}
