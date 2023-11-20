class BaseService

  def self.execute(**args, &block)
    new(**args, &block).execute
  end

  def execute
    raise 'Must be implemented by subclasses'
  end

end