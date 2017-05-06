class Income

  attr_reader :id
  attr_accessor :amount, :date, :time, :provider, :user_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @amount = params['amount']
    @date =  params['date']
    @time = params['time']
    @provider =  params['provider']
    @user_id = params['user_id'].to_i
  end

end
