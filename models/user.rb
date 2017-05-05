class User
  attr_reader :id
  attr_accessor :first_name, :last_name, :dob, :over_budget
  def initialize(params)
    @id =
    @first_name = params['first_name']
    @last_name = params['last_name']
    @dob = params['dob']
    @over_budget = false
  end



end
