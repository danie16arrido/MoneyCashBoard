class Income

  attr_reader :id
  attr_accessor :amount, :user_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @amount = params['amount']
    @user_id = params['user_id'].to_i
  end
end
