class Course{
  late String number;
  late String title;
  late String prereq;
  late String imageURL;

  Course({
    required this.number,
  required this.title,
  required this.prereq,
  required this.imageURL,
  });

}

var courseList = [
  Course(
    number: 'CMSC 0000',
    title: 'Programming III',
    prereq: 'CMSC 1513',
    imageURL: 'http://cs.uco.edu/files/lion.jpg',
  ),
  Course(
    number: 'CMSC 1613',
    title: 'Programming I',
    prereq: 'CMSC 1513',
    imageURL: 'https://m.media-amazon.com/images/I/517rMbNEp+L._AC_UY327_FMwebp_QL65_.jpg',
  ),
  Course(
    number: 'CMSC 1614',
    title: 'Programming II',
    prereq: 'CMSC 1613',
    imageURL: 'https://m.media-amazon.com/images/I/81V8Icx0SzL._AC_UY327_FMwebp_QL65_.jpg',
  ),
  Course(
    number: 'CMSC 1615',
    title: 'Programming Languages',
    prereq: 'CMSC 1614',
    imageURL: 'https://m.media-amazon.com/images/I/61IwXwjf4VL._AC_UY327_FMwebp_QL65_.jpg',
  ),
  Course(
    number: 'CMSC 1616',
    title: 'Data Structures',
    prereq: 'CMSC 1615',
    imageURL: 'https://m.media-amazon.com/images/I/81KM8rjSVcS._AC_UY327_FMwebp_QL65_.jpg',
  ),
  Course(
    number: 'CMSC 1617',
    title: 'Java',
    prereq: 'CMSC 1615',
    imageURL: 'https://m.media-amazon.com/images/I/6129zBhKZsL._AC_UY327_FMwebp_QL65_.jpg',
  ),
  Course(
    number: 'CMSC 1618',
    title: 'Object Oriented SW Design',
    prereq: 'CMSC 1614',
    imageURL: 'https://m.media-amazon.com/images/I/41RTxX-lVDL._AC_UY327_FMwebp_QL65_.jpg',
  ),
];