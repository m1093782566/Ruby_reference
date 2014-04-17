#bosh/blobstore_client/lib/blobstore_client/local_client.rb
module Bosh
  module Blobstore
    class Client
      PROVIDER_NAMES = %w[dav simple s3 swift atmos local]

      def self.create(blobstore_provider, options = {})
        unless PROVIDER_NAMES.include?(blobstore_provider)
          raise BlobstoreError,
            "Unknown client provider '#{blobstore_provider}', " +
            "available providers are: #{PROVIDER_NAMES}"
        end
        blobstore_client_constantize(blobstore_provider).new(options)
      end

      def self.safe_create(provider, options = {})
        wrapped_client = create(provider, options)
      end

      private

      def self.blobstore_client_constantize(base_string)
        class_string = base_string.capitalize + (base_string == 'local' ? '' : 'Blobstore') + 'Client'
        Bosh::Blobstore.const_get class_string
      end
    end
  end
end
