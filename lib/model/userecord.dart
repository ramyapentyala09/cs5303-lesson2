enum Classification {
  FirstYear, SecondYear, ThirdYear, FourthYear, Graduate,
}
enum Major{
  CS, SE, DS, CE, Other,
}
enum Language {
  Dart, Java, JavaScript, Cpp, Csharp, Python,
}
class UserRecord {
  late String email;
  late String password;
  late String name;
  late String phone;
  late int age;
  late Classification classification;
  late Major major;
  late Map<Language, bool> languages;

  UserRecord( {
    this.email = '',
    this.password = '',
    this.name = '',
    this.phone = '',
    this.age = -1,
    this.classification = Classification.FirstYear,
    this.major = Major.CS,
  }) 
  {
    languages = {};
    Language.values.forEach((e) => languages[e] = false);
  }

  UserRecord clone() {
    var copy = UserRecord(
      email: this.email,
    password: this.password,
    name: this.name,
    phone: this.phone,
    age: this.age,
    classification: this.classification,
    major: this.major,
    );
    copy.languages = {...this.languages};
    return copy;
  }
  void copyFrom(UserRecord obj) {
    this.email = obj.email;
    this.password = obj.password;
    this.phone = obj.phone;
    this.age = obj.age;
    this.classification = obj.classification;
    this.major = obj.major;
    this.languages = {...obj.languages};
  }
  static List<UserRecord> fakeDB = [
    UserRecord(
      email: '1@test.com',
      password: '111111',
      name: 'One John',
      phone: '111222333',
      ),
      UserRecord(
      email: '2@test.com',
      password: '222222',
      name: 'Two John',
      phone: '222333444',
      ),
  ];
  @override
  String toString() {
    return 'UserRecord[email=$email password=$password name=$name]';
  }
}