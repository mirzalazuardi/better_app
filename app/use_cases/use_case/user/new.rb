module UseCase
  module User
    class New
      def self.call(repository = UserRepository.new())
        new(repository).call
      end

      def call
        repository.new_entity
      end

      private

      def initialize(repository)
        @repository = repository
      end
      attr_reader :repository
    end
  end
end
