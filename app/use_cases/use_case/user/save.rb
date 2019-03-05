module UseCase
  module User
    class Save
      def self.call(attrs, callbacks, repository = UserRepository.new())
        new(attrs, callbacks, repository).call
      end

      def call
        user = repository.new_entity(attrs)
        repository.save(user) ? callbacks[:success].call(user) : callbacks[:fail].call(user)
      end

      private
      attr_reader :attrs, :callbacks, :repository

      def initialize(attrs, callbacks, repository)
         @attrs, @callbacks, @repository = attrs, callbacks, repository
      end
    end
  end
end
