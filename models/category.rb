class Category
  attr_reader :id
  attr_accessor :name, :master_category_id
  def initialize(params)
    @id = params['id'] if params['id']
    @name = params['name']
    @master_category_id = params['master_category_id'].to_i
  end

end
