import '../models/models.dart';

final User currentUser = User(
  fname: 'Yash',
  lname: 'Halgaonkar',
  imageURL:
      'https://pbs.twimg.com/profile_images/1277925616243732480/oWxzZVXY_400x400.jpg',
);
final String postUrl =
    'https://images.unsplash.com/photo-1608176762644-c471e49d3227?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1934&q=80';
final List<Blog> blogs = [
  Blog(
    author: currentUser,
    title: 'A VIT boy hacks GitHub!',
    date: '27/11/2021',
    description:
        'Yash Halgaonkar, 19, got so frustrated with JS that he decided to end it all.',
  ),
];

final String loren =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin lacus libero, placerat ut justo vitae, sagittis convallis magna. Mauris eget quam quis justo finibus efficitur non quis tellus. Pellentesque viverra nulla dolor, id luctus tellus congue quis. Morbi aliquet eu arcu at volutpat. Quisque euismod dictum eleifend. Donec eu sagittis felis, sed viverra libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vestibulum nec ipsum non venenatis. Quisque interdum, ligula in dictum rhoncus, ipsum felis placerat est, in venenatis dui lorem ac eros.';
