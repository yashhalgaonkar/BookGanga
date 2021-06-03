class BlogToDisplay {
  String blogId;
  String title;
  String authorName;
  String authorUsername;
  String userId;
  String authorImageUrl;
  String blogHeaderImageUrl;
  String lastUpdated;
  int numLikes;
  int numComments;
  String description;

  BlogToDisplay({
    String blogId,
    this.title,
    this.authorName,
    this.userId,
    this.authorImageUrl,
    this.blogHeaderImageUrl,
    this.lastUpdated,
    this.numLikes,
    this.numComments,
    this.description,
    this.authorUsername,
  });

  factory BlogToDisplay.fromJson(Map<String, dynamic> item) {
    return BlogToDisplay(
        title: item['title'],
        authorName: item['authorName'],
        userId: item['userId'],
        authorImageUrl: item['authorImageUrl'],
        blogHeaderImageUrl: item['blogHeaderImageUrl'],
        //lastUpdated: item['lastUpdated'],
        numLikes: item['numLikes'],
        authorUsername: item['username'],
        numComments: item['numComments'],
        description: item['description']);
  }
}
