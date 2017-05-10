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

  def log_transfer(amount, category_id)
    transfer_data = {
      'amount' => amount,
      'user_id' => @id,
      'category_id' => category_id.to_i
    }
    new_transfer = Transfer.new(transfer_data)
    new_transfer.save()
  end

  def list_transfers()
    sql = "SELECT * FROM transfers
    WHERE user_id = #{@id};"
    result = SqlRunner.run(sql)
    return result.map { |transfer| Transfer.new(transfer)}
  end

  def list_transfers_by_date()
    sql = "SELECT * FROM transfers
    WHERE user_id = #{@id} ORDER BY id DESC;"
    result = SqlRunner.run(sql)
    return result.map { |transfer| Transfer.new(transfer)}
  end

  def total_amount_spent()
    result = list_transfers()
    amounts_array = result.map { |transfer| transfer.amount.to_f }
    return amounts_array.sum()
  end

  def list_transfers_by_master_category(master_category_id)
    sql = "
    SELECT * FROM transfers t
    INNER JOIN categories c
    on t.category_id = c.id
    WHERE c.master_category_id = #{master_category_id} AND
    t.user_id = #{@id};
    "
    result = SqlRunner.run(sql)
    return result.map { |transfer| Transfer.new(transfer)}
  end

  def total_master_category(master_category_id)
    all = list_transfers_by_master_category(master_category_id)
    amounts = all.map { |transfer| transfer.amount.to_f}
    return amounts.inject(0){|sum,x| sum + x }
  end

  def list_transfers_by_category(category_id)
    sql = "
    SELECT t.* FROM transfers t
    INNER JOIN categories c
    on t.category_id = c.id
    WHERE c.id = #{category_id} AND t.user_id = #{@id};
    "
    result = SqlRunner.run(sql)
    return result.map { |transfer| Transfer.new(transfer)}
  end

  def total_category(category_id)
    all = list_transfers_by_category(category_id)
    amounts = all.map { |transfer| transfer.amount.to_f}
    return amounts.inject(0){|sum,x| sum + x }
  end

  def add_income(amount, provider)
    data = {'amount' => amount,
            'provider' => provider,
            'user_id' => @id}
    income = Income.new(data)
    income.save()
  end

  # def transfer_from_to(start, end)
  #   sql = "
  #   SELECT * FROM transfers WHERE op_date >= '#{start}' and op_date < '#{end}' and user_id=#{@id};
  # end
end
