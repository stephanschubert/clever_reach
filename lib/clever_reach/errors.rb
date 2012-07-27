module CleverReach
  module Errors
    # http://support.cleverreach.de/entries/20674817-fehlercode-api

    class BaseError < StandardError
    end

    class InvalidAPIKey < BaseError;
      def initialize
        super('invalid API key')
      end
    end

    class NeedSessionBeforeUsage < BaseError
      def initialize
        super('need session before usage')
      end
    end

    class PermissionDenied < BaseError
      def initialize
        super('permission denied')
      end
    end

    class DataNotFound < BaseError
      def initialize
        super('data not found')
      end
    end

    class EmailInvalid < BaseError
      def initialize
        super('email invalid')
      end
    end

    class EmailBlacklisted < BaseError
      def initialize
        super('email blacklisted')
      end
    end

    class DuplicateData < BaseError
      def initialize
        super('duplicate data')
      end
    end

    class SubscriberAlreadyActive < BaseError
      def initialize
        super('subscriber already active')
      end
    end

    class InsertingOrderFailed < BaseError
      def initialize
        super('inserting order failed')
      end
    end

    class BatchTooBig < BaseError
      def initialize
        super('batch too big (max 50)')
      end
    end

    class SubscriberAlreadyInactive < BaseError
      def initialize
        super('subscriber already inactive')
      end
    end

    class GivenEmailIsTooShort < BaseError
      def initialize
        super('given email is too short')
      end
    end

    class NoFormsAvailable < BaseError
      def initialize
        super('no forms available')
      end
    end

    class ErrorSavingFilter < BaseError
      def initialize
        super('error saving filter')
      end
    end

    ErrorMap = {
      1   => InvalidAPIKey,
      5   => NeedSessionBeforeUsage,
      10  => PermissionDenied,
      20  => DataNotFound,
      30  => EmailInvalid,
      40  => EmailBlacklisted,
      50  => DuplicateData,
      60  => SubscriberAlreadyActive,
      70  => InsertingOrderFailed,
      80  => BatchTooBig,
      90  => SubscriberAlreadyInactive,
      100 => GivenEmailIsTooShort,
      110 => NoFormsAvailable,
      120 => ErrorSavingFilter,
    }

    def self.lookup(code)
      ErrorMap[code]
    end
  end
end
