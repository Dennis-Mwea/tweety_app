import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/local/entity/article_entity.dart';
import 'package:moor/moor.dart';

part 'article_dao.g.dart';

@UseDao(tables: [Articles])
class ArticleDao extends DatabaseAccessor<AppDatabase> with _$ArticleDaoMixin {
  final AppDatabase appDatabase;

  ArticleDao(this.appDatabase) : super(appDatabase);

  Future insertTag(Insertable<Article> article) => into(articles).insert(article);

  Future saveArticles(List<Insertable<Article>> items) {
    return transaction(() async {
      for (Insertable<Article> item in items) await into(articles).insert(item);
    });
  }

  Future<List<Article>> getAllUsers() => select(articles).get();

  Future<Article> getArticleById(int id) => select(articles).getSingle();
}
