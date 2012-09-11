require 'webmachine'
require 'webmachine/adapters/rack'

class AcceptMismatchResource < Webmachine::Resource
  def allowed_methods
    %w(GET POST)
  end

  def content_types_provided
    []
  end
  
  def content_types_accepted
    []
  end
end

class EntityLessResource < Webmachine::Resource
  def process_post
    true
  end

  def allowed_methods
    %w(POST)
  end

  def content_types_accepted
    [['application/json', :accept_json]]
  end

  def content_types_provided
    [['application/json', :to_json]]
  end

  def to_json
  end

  def accept_json
  end
end

webmachine = Webmachine::Application.new do |app|
  app.routes do
    add ['accept_mismatch'], AcceptMismatchResource
    add ['entity_less'], EntityLessResource
  end

  app.configure do |config|
    config.adapter = :Rack
  end
end

run webmachine.adapter
