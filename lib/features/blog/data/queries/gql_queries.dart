mixin GqlQuery {
  static String allPostsQuery = '''
    query GetAllPosts(\$options: PageQueryOptions!){
    posts(options: \$options){
      data {
        id, title, body, 
      }
      meta {
        totalCount
      }
    }
  }
  ''';
}
