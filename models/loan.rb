class Loan < Income

  attr_accessor :is_payed

  def initialize(params)
    super(params)
    @is_payed = params['is_payed']
  end
  
end
