module UseCase
  module User
    class FindOrInitializeBy
      def self.call(attrs, repository = UserRepository.new())
        new(attrs, repository).call(attrs)
      end

      def call(attrs)
        repository.find_or_initialize_by(attrs)
      end

      private
      attr_reader :attrs, :repository

      def initialize(attrs, repository)
         @attrs, @repository = attrs, repository
      end
    end
  end
end
