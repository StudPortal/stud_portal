module VotesSubcontroller
  extend ActiveSupport::Concern
  
  def up_vote
    record.up_vote 
    render json: {status: 200}
  end

  def down_vote
    record.down_vote
    render json: {status: 200}
  end

  private

  def model
    self.class.name.sub('Controller', '').singularize
  end

  def record
    model.constantize.find params["#{model.downcase}_id".to_sym]
  end

end