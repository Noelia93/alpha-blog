class CreateArticleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :article_categories do |t|
      t.belongs_to :article, index: true
      t.belongs_to :category, index: true
    end
  end
end


#tenemos el caso many-to-many lo que hacemos es poner en la migracion belongs_to (se puede ver en la página de
# ruby associations basic). Ponemos index: true que es un campo primario, lo que le dice es que use la id que tiene
# para buscar en la tabla y poder asociar. Ahora si nos vamos a article_category.rb vemos que tiene tb su belongs_to
# que lo que hace es conectar a article y a categories. Y ya en category.rb y en article.rb uso el many to many