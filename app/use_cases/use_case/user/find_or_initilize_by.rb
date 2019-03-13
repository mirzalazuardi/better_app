module UseCase
  module User
    class FindOrInitializeBy
      def self.call(user, attrs, callbacks, repository = UserRepository.new())
        new(attrs, callbacks, repository).call(attrs)
      end

      def call(attrs)
        repository.find_or_initialize_by(attrs)
      end

      private
      attr_reader :user, :attrs, :callbacks, :repository

      def initialize(user, attrs, callbacks, repository)
         @user, @attrs, @callbacks, @repository = user, attrs, callbacks, repository
      end
    end
  end
end
