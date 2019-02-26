module UseCase
  module User
    class Find
      def self.call(id, repository = UserRepository.new())
        new(id, repository).call
      end

      def call
        repository.find(id)
      end

      private

      def initialize(id, repository)
        @id, @repository = id, repository
      end
      attr_reader :id, :repository
    end
  end
end
