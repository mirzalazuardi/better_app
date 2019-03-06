module UseCase
  module User
    class Delete
      def self.call(user, callbacks, repository = UserRepository.new())
        new(user, callbacks, repository).call
      end

      def call
        repository.delete(user) ? callbacks[:success].call(user) : callbacks[:fail].call(user)
      end

      private
      attr_reader :user, :callbacks, :repository

      def initialize(user, callbacks, repository)
         @user,  @callbacks, @repository = user, callbacks, repository
      end
    end
  end
end
