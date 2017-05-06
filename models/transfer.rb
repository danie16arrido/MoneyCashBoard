class Transfer

  attr_reader :id
  attr_accessor :amount, :op_date, :op_time, :user_id, :category_id

  def initialize(params)
    @id = params['id'] if params['id']
    @amount = params['amount']
    @op_date = params['op_date'] if params['op_date']
    @op_time = params['op_time'] if params['op_time']
    @user_id = params['user_id'].to_i
    @category_id = params['category_id'].to_i
  end

  def save()
    sql = "
    INSERT INTO transfers
    (amount, op_date, op_time, user_id, category_id) VALUES
    ('#{@amount}', CURRENT_DATE, LOCALTIME(0), #{@user_id}, #{@category_id})
    RETURNING *;
    "
    transfer_data = SqlRunner.run(sql)
    @id = transfer_data.first()['id'].to_i
    @op_date = transfer_data.first()['op_date']
    @op_time = transfer_data.first()['op_time']
  end

  def self.all()
    sql = "
    SELECT * FROM transfers;
    "
    result = SqlRunner.run(sql)
    transfers_hash = result.map { |a_transfer| Transfer.new(a_transfer) }
    return transfers_hash
  end

  def self.find_by_id(id)
    sql = "
    SELECT * FROM transfers WHERE id = #{id};
    "
    result = SqlRunner.run(sql)
    return Transfer.new(result.first())
  end

  def update()
    sql = "
    UPDATE transfers SET
    (amount, op_date, op_time, user_id, category_id) =
    ('#{@amount}', '#{@op_date}', '#{@op_time}', #{@user_id}, #{@category_id})
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM transfers WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "
    DELETE FROM transfers;
    "
    SqlRunner.run(sql)
  end

end
