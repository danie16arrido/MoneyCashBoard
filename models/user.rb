class User
  attr_reader :id
  attr_accessor :first_name, :last_name, :dob, :over_budget
  def initialize(params)
    @id = params['id'].to_i if params['id']
    @first_name = params['first_name']
    @last_name = params['last_name']
    @dob = params['dob']
    @over_budget = params['over_budget']
  end

  def save()
    sql = "
    INSERT INTO users
    (first_name, last_name, dob, over_budget) VALUES
    ('#{@first_name}', '#{@last_name}', '#{@dob}', 'false')
    RETURNING id;
    "
    user_data = SqlRunner.run(sql)
    @id = user_data.first()['id'].to_i
  end

  def self.all()
    sql = "
    SELECT * FROM users;
    "
    result = SqlRunner.run(sql)
    users_hash = result.map { |a_user| User.new(a_user) }
    return users_hash
  end

  def self.find_by_id(id)
    sql = "
    SELECT * FROM users WHERE id = #{id};
    "
    result = SqlRunner.run(sql)
    return User.new(result.first())
  end

  def update()
    sql = "
    UPDATE users SET
    (first_name, last_name, dob, over_budget) =
    ('#{@first_name}', '#{@last_name}', '#{@dob}', #{@over_budget})
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM users WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "
    DELETE FROM users;
    "
    SqlRunner.run(sql)
  end

end
