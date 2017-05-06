class Transfer

  attr_reader :id
  attr_accessor :amount, :op_date, :time, :user_id, :category_id

  def initialize(params)
    @id = params['id'] if params['id']
    @amount = params['amount']
    @op_date = params['date']
    @time = params['time']
    @user_id = params['user_id'].to_i
    @category_id = params['category_id'].to_i
  end
end
