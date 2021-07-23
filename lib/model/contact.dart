class Contact{
  String instaUrl;
  String instaUrlPath;
  String shortMail;
  String mail;
  String get mailUri => 'mailto:$mail';
  Contact({this.instaUrl, this.instaUrlPath, this.mail, this.shortMail});
}