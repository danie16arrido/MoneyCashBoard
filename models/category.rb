class Category

  attr_reader :id
  attr_accessor :name, :master_category_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @master_category_id = params['master_category_id'].to_i
  end

  def save()
    sql = "
    INSERT INTO categories
    (name, master_category_id) VALUES ('#{@name}', '#{@master_category_id}')
    RETURNING id;
    "
    category_data = SqlRunner.run(sql)
    @id = category_data.first()['id'].to_i
  end

  def self.all()
    sql = "
    SELECT * FROM categories;
    "
    result = SqlRunner.run(sql)
    categories_hash = result.map { |a_category| Category.new(a_category) }
    return categories_hash
  end

  def self.find_by_id(id)
    sql = "
    SELECT * FROM categories WHERE id = #{id};
    "
    result = SqlRunner.run(sql)
    return Category.new(result.first())
  end

  def update()
    sql = "
    UPDATE categories SET
    (name, master_category_id) = ('#{@name}', '#{@master_category_id}')
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM categories WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "
    DELETE FROM categories;
    "
    SqlRunner.run(sql)
  end

  def self.find_by_name(name)
    sql = "
    SELECT * FROM categories WHERE name = '#{name}';
    "
    result = SqlRunner.run(sql)
    return Category.new(result.first)
  end

  def master_category()
    sql = "
    SELECT * from mastercategories WHERE id = #{@master_category_id};
    "
    result = SqlRunner.run(sql)
    return MasterCategory.new(result.first)
  end

end
