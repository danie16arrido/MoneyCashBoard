class Loan < Income

  attr_accessor :is_payed

  def initialize(params)
    super(params)
    @is_payed = params['is_payed'] if params['is_payed']
  end

  def save()
    sql = "
        INSERT INTO loans
        (amount, op_date, op_time, provider, user_id, is_payed) VALUES
        ('#{@amount}', CURRENT_DATE, LOCALTIME(0), '#{@provider}', '#{@user_id}', FALSE)
        RETURNING *;
        "
    loan_data = SqlRunner.run(sql)
    @id = loan_data.first()['id'].to_i
    @op_date= loan_data.first()['op_date']
    @op_time = loan_data.first()['op_time']
    @is_payed = loan_data.first()['is_payed']
  end

  def self.all()
    sql = "SELECT * FROM loans;"
    result = SqlRunner.run(sql)
    loans_hash = result.map { |a_loan| Loan.new(a_loan) }
    return loans_hash
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM loans WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return Loan.new(result.first())
  end

  def update()
    sql = "
    UPDATE loans SET
    (amount, op_date, op_time, provider, user_id, is_payed) =
    ('#{@amount}',
    to_date('#{@op_date}', 'YYYY MM DD'),
    to_timestamp('#{@op_time}', 'HH24 MI SS'),
    '#{@provider}',
    '#{@user_id}',
    '#{@is_payed}')
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM loans WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "
    DELETE FROM loans;
    "
    SqlRunner.run(sql)
  end




end
