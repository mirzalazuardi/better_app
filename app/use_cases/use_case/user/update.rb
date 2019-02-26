module UseCase
  module User
    class Update
      def self.call(user, attrs, callbacks, repository = UserRepository.new())
        new(user, attrs, callbacks, repository).call
      end

      def call
        user.assign_attributes(attrs)
        repository.save(user) ? callbacks[:success].call(user) : callbacks[:fail].call()
      end

      private
      attr_reader :user, :attrs, :callbacks, :repository

      def initialize(user, attrs, callbacks, repository)
         @user, @attrs, @callbacks, @repository = user, attrs, callbacks, repository
      end
    end
  end
end
