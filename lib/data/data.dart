import '../models/models.dart';

final User currentUser = User(
  fname: 'Yash',
  username: 'yash.halgaonkar',
  lname: 'Halgaonkar',
  bio: 'The greatest thing i do is I write comments and I dont break hearts!',
  profileImageUrl:
      'https://pbs.twimg.com/profile_images/1277925616243732480/oWxzZVXY_400x400.jpg',
  numBlogs: 17,
  numFollowers: 458,
  numFollowing: 356,
  numReviews: 9,
);

final List<User> userList = [
  currentUser,
  User(
    username: 'aditya.giradkar57',
    fname: 'Aditya',
    lname: 'Giradkar',
    profileImageUrl:
        'https://media-exp1.licdn.com/dms/image/C5103AQHa4d6-Y4f2xQ/profile-displayphoto-shrink_800_800/0/1564050324092?e=1620259200&v=beta&t=csDQ0SYOKn0wy-pNMYdgeuTZI2I-Ar2OVb-62KgpBNQ',
  ),
  User(
    username: 'loren.ipsum.studio',
    fname: 'Shivam',
    lname: 'Itankar',
    profileImageUrl:
        'https://media-exp1.licdn.com/dms/image/C4D03AQH8V60F2J4g5w/profile-displayphoto-shrink_800_800/0/1614077548078?e=1620259200&v=beta&t=HHPdCyl22jNZ9AwB5LPzpaDDRjl1kall_lNNsy4V9Is',
  ),
  User(
    username: 'mansi.jadhav',
    fname: 'Mansi',
    lname: 'Jadhav',
    profileImageUrl:
        'https://media-exp1.licdn.com/dms/image/C5603AQFFx9eM8hYSww/profile-displayphoto-shrink_800_800/0/1614458904242?e=1620259200&v=beta&t=gTK3PBhHXJFiu5CoPgtvFdubbNUrr_Wm3SeoXkIUC2k',
  ),
  User(
    username: 'patil.sunita',
    fname: 'Sunita',
    lname: 'Patil',
    profileImageUrl:
        'https://media-exp1.licdn.com/dms/image/C5103AQEv6aU2JgFHBQ/profile-displayphoto-shrink_800_800/0/1574517762361?e=1620259200&v=beta&t=uGYtngOSYC0QMUlaDYDZKfWoPnJwtpt_U-f4srI5Pk0',
  ),
  User(
    username: 'sanket.supekar17',
    fname: 'Sanket',
    lname: 'Supekar',
    profileImageUrl:
        'https://images.unsplash.com/photo-1469460340997-2f854421e72f?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDQwfHRvd0paRnNrcEdnfHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  User(
    username: 'mangeshD74',
    fname: 'Mangesh',
    lname: 'Dhondre',
    profileImageUrl:
        'https://images.unsplash.com/photo-1614492052748-7c182718eaa0?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDQyfHRvd0paRnNrcEdnfHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  User(
    username: 'akankasha15',
    fname: 'Akankasha',
    lname: 'Kasar',
    profileImageUrl:
        'https://media-exp1.licdn.com/dms/image/C4D03AQE7B6_15wOr2w/profile-displayphoto-shrink_800_800/0/1607142702827?e=1620259200&v=beta&t=deqTEu_TN5Lvh1YFUmU7AZx1B2uBfGhiLOu8EyLmnek',
  ),
  User(
    username: 'bhatti99',
    fname: 'Hardik',
    lname: 'Bhatii',
    profileImageUrl:
        'https://images.unsplash.com/photo-1614449203851-926c8509ebe2?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDIyfHRvd0paRnNrcEdnfHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  User(
    username: 'aye_hc',
    fname: 'Harshal',
    lname: 'Chavan',
    profileImageUrl:
        'https://images.unsplash.com/photo-1568648801431-a7be13ee3a03?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDMxfHRvd0paRnNrcEdnfHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  User(
    username: 'abhinotion',
    fname: 'Abhinay',
    lname: 'Talkhedkar',
    profileImageUrl:
        'https://images.unsplash.com/photo-1530842025973-11b5f5013b2e?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDI4fHRvd0paRnNrcEdnfHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
];

final String postUrl =
    'https://images.unsplash.com/photo-1608176762644-c471e49d3227?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1934&q=80';

final List<Blog> blogs = [
  Blog(
      author: currentUser, //yash halgaonkar
      title: 'Happyness or Happiness??',
      description:
          'Yash Halgaonkar, 19, got so frustrated with life and decides to be happy.',
      readCount: 154,
      shareCount: 25,
      titleImageUrl:
          'https://images.unsplash.com/photo-1604346782646-13dac014c258?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8Ym84alFLVGFFMFl8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  Blog(
    author: userList[1], // aditya giradkar
    title: 'A VIT boy hacks GitHub!',
    description:
        'Aditya hacks GitHub and becomes major contributor of all JS repos',
    readCount: 547,
    shareCount: 54,
    titleImageUrl:
        'https://images.unsplash.com/photo-1564865878688-9a244444042a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8Y29kZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  Blog(
      author: userList[2], // shivam itankar
      title: 'Desinging the Future',
      description:
          'orem ipsum dolor sit amet, consectetur adipiscing elit. Proin lacus libero, placerat ut justo vitae, sagittis c',
      readCount: 154,
      shareCount: 25,
      titleImageUrl:
          'https://images.unsplash.com/photo-1614517409437-2e25e4f5dbed?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDEyfHJuU0tESHd3WVVrfHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  Blog(
      author: userList[3], // mansi jadhav
      title: 'Happyness or Happiness??',
      description:
          'ur adipiscing elit. Proin lacus libero, placerat ut justo vitae, sagittis co',
      readCount: 154,
      shareCount: 25,
      titleImageUrl:
          'https://images.unsplash.com/photo-1614533708409-fdad0805a4fa?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8dG93SlpGc2twR2d8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60'),
  Blog(
      author: userList[4], // sunita patil
      title: 'Experiencing Long Distanace Relationship',
      description:
          'ur adipiscing elit. Proin lacus libero, placerat ut justo vitae, sagittis co',
      readCount: 154,
      shareCount: 25,
      titleImageUrl:
          'https://images.unsplash.com/photo-1549825987-0b01889f671f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8cm9tYW5jZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  Blog(
      author: userList[5], //sanket
      title: 'Being Gay!',
      description:
          'Sanket Supekar shares how its like to be gay in modern sub urban India.',
      readCount: 154,
      shareCount: 25,
      titleImageUrl:
          'https://images.unsplash.com/photo-1567476783296-fff06012e17a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Z2F5fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  Blog(
      author: userList[6], // mangesh
      title: '101 ways to impress girls.',
      description:
          'Mangesh Dhondre shares his sureshot ways to get a pussy whenever you want.',
      readCount: 154,
      shareCount: 25,
      titleImageUrl:
          'https://images.unsplash.com/photo-1600601622243-f32c30680b0b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjJ8fHNleHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  Blog(
      author: userList[7], // akankasha
      title: 'A Masterclass on Leaving',
      description: 'Akankasha Kasar shares her experience on leaving.',
      readCount: 154,
      shareCount: 25,
      titleImageUrl:
          'https://images.unsplash.com/photo-1551845811-1539fc1f4812?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8YnJlYWslMjB1cHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  Blog(
      author: userList[8], // hardik
      title: 'Looking at the world from top',
      description: 'Hardik Bhatti shares his view of the world.',
      readCount: 154,
      shareCount: 25,
      titleImageUrl:
          'https://images.unsplash.com/photo-1506946526854-9aad1ec915cb?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8ZG93bnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  Blog(
      author: userList[9], //harshal
      title: 'Bootcamp on Moving On',
      description: 'Harshal Chavan shares his priceless guidance on moving on.',
      readCount: 154,
      shareCount: 25,
      titleImageUrl:
          'https://images.unsplash.com/photo-1592771659608-5c03144b1f04?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjd8fG1vdmUlMjBvbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  Blog(
    author: userList[10], // abhinay
    title: 'Spirituality and Me',
    description: loren,
    readCount: 154,
    shareCount: 25,
    titleImageUrl:
        'https://images.unsplash.com/photo-1496008889433-9b938d8ac880?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8c3Bpcml0dWFsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
];

final String loren =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin lacus libero, placerat ut justo vitae, sagittis convallis magna. Mauris eget quam quis justo finibus efficitur non quis tellus. Pellentesque viverra nulla dolor, id luctus tellus congue quis. Morbi aliquet eu arcu at volutpat. Quisque euismod dictum eleifend. Donec eu sagittis felis, sed viverra libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vestibulum nec ipsum non venenatis. Quisque interdum, ligula in dictum rhoncus, ipsum felis placerat est, in venenatis dui lorem ac eros.';
