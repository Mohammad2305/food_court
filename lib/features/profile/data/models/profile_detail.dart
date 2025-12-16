class ProfileDetailModel{
  const ProfileDetailModel({required this.icon, required this.title, required this.onTap});

  final String icon;
  final String title;
  final void Function() onTap;
}