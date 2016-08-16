module Rdaniels
  extend self

  def configure(&block)
    instance_eval &block
    @config
  end

  def config
    @config ||= OpenStruct.new
  end
end


