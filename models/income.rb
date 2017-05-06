class Income

  attr_reader :id
  attr_accessor :amount, :op_date, :op_time, :provider, :user_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @amount = params['amount']
    @op_date =  params['op_date'] if params['op_date']
    @op_time = params['op_time'] if params['op_time']
    @provider =  params['provider']
    @user_id = params['user_id'].to_i
  end

  def save()
    sql = "
    INSERT INTO incomes
    (amount, op_date, op_time, provider, user_id) VALUES
    ('#{@amount}', CURRENT_DATE, LOCALTIME(0), '#{@provider}', '#{@user_id}')
    RETURNING id;
    "
    income_data = SqlRunner.run(sql)
    @id = income_data.first()['id'].to_i
    @op_date= income_data.first()['op_date'].to_i
    @op_time = income_data.first()['op_time'].to_i
  end

  def self.all()
    sql = "
    SELECT * FROM incomes;
    "
    result = SqlRunner.run(sql)
    incomes_hash = result.map { |a_income| Income.new(a_income) }
    return incomes_hash
  end

  def self.find_by_id(id)
    sql = "
    SELECT * FROM incomes WHERE id = #{id};
    "
    result = SqlRunner.run(sql)
    return Income.new(result.first())
  end

  def update()
    sql = "
    UPDATE incomes SET
    (amount, op_date, op_time, provider, user_id) =
    ('#{@amount}', '#{@op_date}', '#{@op_time}','#{@provider}', '#{@user_id}')
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM incomes WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "
    DELETE FROM incomes;
    "
    SqlRunner.run(sql)
  end

end
