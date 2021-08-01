import 'package:data/src/datasource/local/entity/article_entity.dart';
import 'package:floor/floor.dart';

const _tableName = 'ArticleEntity';

@dao
abstract class ArticleDao {
  @Query('SELECT * FROM $_tableName')
  Future<List<ArticleEntity>> getArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveArticles(List<ArticleEntity> articles);

  @Query('SELECT * FROM $_tableName WHERE id = :id')
  Future<ArticleEntity?> getArticleById(int id);
}
