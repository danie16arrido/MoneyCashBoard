require_relative('../db/sqlrunner.rb')

class MasterCategory

  attr_reader :id
  attr_accessor :name

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end

  def save()
    sql = "
    INSERT INTO mastercategories
    (name) VALUES ('#{@name}')
    RETURNING id;
    "
    category_data = SqlRunner.run(sql)
    @id = category_data.first()['id'].to_i
  end

  def self.all()
    sql = "
    SELECT * FROM mastercategories;
    "
    result = SqlRunner.run(sql)
    mastercategories_hash = result.map { |a_m_category| MasterCategory.new(a_m_category) }
    return mastercategories_hash
  end

  def self.find_by_id(id)
    sql = "
    SELECT * FROM mastercategories WHERE id = #{id};
    "
    result = SqlRunner.run(sql)
    return MasterCategory.new(result.first())
  end

  def update()
    sql = "
    UPDATE mastercategories SET
    (name) = ('#{@name}')
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM mastercategories WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

end
