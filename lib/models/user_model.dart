class User {
  String fname;
  String lname;
  String profileImageUrl;
  String username;
  String bio;
  int numFollowers;
  int numFollowing;
  int numBlogs;
  int numReviews;

  User(
      {this.fname,
      this.lname,
      this.profileImageUrl,
      this.username,
      this.bio,
      this.numBlogs,
      this.numFollowers,
      this.numFollowing,
      this.numReviews});
}
