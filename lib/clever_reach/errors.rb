module CleverReach
  module Errors
    # http://support.cleverreach.de/entries/20674817-fehlercode-api
    ErrorMap = {
      1   => 'invalid API Key',
      5   => 'need session before usage',
      10  => 'permission denied',
      20  => 'data not found',
      30  => 'email invalid',
      40  => 'email blacklisted',
      50  => 'duplicate data',
      60  => 'subscriber already active',
      70  => 'inserting order failed',
      80  => 'batch to big (max 50)',
      90  => 'subscriber already inactive',
      100 => 'given email is to short',
      110	=> 'no forms available',
      120	=> 'error saving filter'
    }

    class BaseError < StandardError; end
    class InvalidAPIKey < BaseError; end
    class NeedSessionBeforeUsage < BaseError; end
    class PermissionDenied < BaseError; end
    class DataNotFound < BaseError; end
    class EmailInvalid < BaseError; end
    class EmailBlacklisted < BaseError; end
    class DuplicateData < BaseError; end
    class SubscriberAlreadyActive < BaseError; end
    class InsertingOrderFailed < BaseError; end
    class BatchTooBig < BaseError; end
    class SubscriberAlreadyInactive < BaseError; end
    class GivenEmailIsTooShort < BaseError; end
    class NoFormsAvailable < BaseError; end
    class ErrorSavingFilter < BaseError; end
  end
end
