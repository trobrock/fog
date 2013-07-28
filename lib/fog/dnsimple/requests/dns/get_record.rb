module Fog
  module DNS
    class DNSimple
      class Real

        # Gets record from given domain.
        #
        # ==== Parameters
        # * domain<~String>
        # * record_id<~String>
        # ==== Returns
        # * response<~Excon::Response>:
        #   * record<~Hash>
        #     * name<~String>
        #     * ttl<~Integer>
        #     * created_at<~String>
        #     * special_type<~String>
        #     * updated_at<~String>
        #     * domain_id<~Integer>
        #     * id<~Integer>
        #     * content<~String>
        #     * record_type<~String>
        #     * prio<~Integer>
        def get_record(domain, record_id)

          request( :expects  => 200,
                   :method   => "GET",
                   :path     => "/domains/#{domain}/records/#{record_id}" )
        end

      end

      class Mock

        def get_record(domain, record_id)
          response = Excon::Response.new
          response.status = 200
          response.body = self.data[:records][domain].detect { |record| record["record"]["id"] == record_id }
          response
        end
      end
    end
  end
end
