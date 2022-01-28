class ApplicationService
  Result = Struct.new(:success, :data, :errors, keyword_init: true)

  def self.call(...)
    new(...).call
  end
end