class BaseDecorator < SimpleDelegator
  include ViewHelpers
  def self.wrap_collection(collection)
    collection.map { |obj| new obj }
  end
end
