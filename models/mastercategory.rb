class MasterCategory
  attr_reader :id
  attr_accessor :name
  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end

end
