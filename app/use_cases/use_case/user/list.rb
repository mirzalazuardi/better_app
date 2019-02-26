module UseCase
  module User
    class List
      def self.call(repository = UserRepository.new())
        new(repository).call
      end

      def call
        user = repository
        user.all
      end

      private

      def initialize(repository)
        @repository = repository
      end
      attr_reader :repository
    end
  end
end
