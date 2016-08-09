##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Preview < Domain
      class Sync < Version
        class ServiceContext < InstanceContext
          class DocumentList < ListResource
            ##
            # Initialize the DocumentList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            
            # @return [DocumentList] DocumentList
            def initialize(version, service_sid: nil)
              super(version)
              
              # Path Solution
              @solution = {
                  service_sid: service_sid
              }
              @uri = "/Services/#{@solution[:service_sid]}/Documents"
            end
            
            ##
            # Retrieve a single page of DocumentInstance records from the API.
            # Request is executed immediately.
            # @param [String] unique_name The unique_name
            # @param [Hash] data The data
            
            # @return [DocumentInstance] Newly created DocumentInstance
            def create(unique_name: nil, data: nil)
              data = {
                  'UniqueName' => unique_name,
                  'Data' => data,
              }
              
              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )
              
              return DocumentInstance.new(
                  @version,
                  payload,
                  service_sid: @solution['service_sid'],
              )
            end
            
            ##
            # Lists DocumentInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(
                  limit: limit,
                  page_size: page_size
              ).entries
            end
            
            ##
            # Streams DocumentInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)
              
              page = self.page(
                  page_size: limits['page_size'],
              )
              
              @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
            end
            
            ##
            # When passed a block, yields DocumentInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to read the
            #                       limit with the most efficient page size, i.e. min(limit, 1000)
            def each
              limits = @version.read_limits
              
              page = self.page(
                  page_size: limits['page_size'],
              )
              
              @version.stream(page,
                              limit: limits['limit'],
                              page_limit: limits['page_limit']).each {|x| yield x}
            end
            
            ##
            # Retrieve a single page of DocumentInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            
            # @return [Page] Page of DocumentInstance
            def page(page_token: nil, page_number: nil, page_size: nil)
              params = {
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              }
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return DocumentPage.new(@version, response, @solution)
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Sync.DocumentList>'
            end
          end
        
          class DocumentPage < Page
            ##
            # Initialize the DocumentPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] service_sid The service_sid
            
            # @return [DocumentPage] DocumentPage
            def initialize(version, response, solution)
              super(version, response)
              
              # Path Solution
              @solution = solution
            end
            
            ##
            # Build an instance of DocumentInstance
            # @param [Hash] payload Payload response from the API
            
            # @return [DocumentInstance] DocumentInstance
            def get_instance(payload)
              return DocumentInstance.new(
                  @version,
                  payload,
                  service_sid: @solution['service_sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Sync.DocumentPage>'
            end
          end
        
          class DocumentContext < InstanceContext
            ##
            # Initialize the DocumentContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            
            # @return [DocumentContext] DocumentContext
            def initialize(version, service_sid, sid)
              super(version)
              
              # Path Solution
              @solution = {
                  service_sid: service_sid,
                  sid: sid,
              }
              @uri = "/Services/#{@solution[:service_sid]}/Documents/#{@solution[:sid]}"
            end
            
            ##
            # Fetch a DocumentInstance
            # @return [DocumentInstance] Fetched DocumentInstance
            def fetch
              params = {}
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return DocumentInstance.new(
                  @version,
                  payload,
                  service_sid: @solution['service_sid'],
                  sid: @solution['sid'],
              )
            end
            
            ##
            # Deletes the DocumentInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              return @version.delete('delete', @uri)
            end
            
            ##
            # Update the DocumentInstance
            # @param [Hash] data The data
            
            # @return [DocumentInstance] Updated DocumentInstance
            def update(data: nil)
              data = {
                  'Data' => data,
              }
              
              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )
              
              return DocumentInstance.new(
                  @version,
                  payload,
                  service_sid: @solution['service_sid'],
                  sid: @solution['sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Sync.DocumentContext #{context}>"
            end
          end
        
          class DocumentInstance < InstanceResource
            ##
            # Initialize the DocumentInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            
            # @return [DocumentInstance] DocumentInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'unique_name' => payload['unique_name'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'url' => payload['url'],
                  'revision' => payload['revision'],
                  'data' => payload['data'],
                  'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                  'created_by' => payload['created_by'],
              }
              
              # Context
              @instance_context = nil
              @params = {
                  'service_sid' => service_sid,
                  'sid' => sid || @properties['sid'],
              }
            end
            
            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            
            # @return [DocumentContext] DocumentContext for this DocumentInstance
            def context
              unless @instance_context
                @instance_context = DocumentContext.new(
                    @version,
                    @params['service_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end
            
            def sid
              @properties['sid']
            end
            
            def unique_name
              @properties['unique_name']
            end
            
            def account_sid
              @properties['account_sid']
            end
            
            def service_sid
              @properties['service_sid']
            end
            
            def url
              @properties['url']
            end
            
            def revision
              @properties['revision']
            end
            
            def data
              @properties['data']
            end
            
            def date_created
              @properties['date_created']
            end
            
            def date_updated
              @properties['date_updated']
            end
            
            def created_by
              @properties['created_by']
            end
            
            ##
            # Fetch a DocumentInstance
            # @return [DocumentInstance] Fetched DocumentInstance
            def fetch
              @context.fetch()
            end
            
            ##
            # Deletes the DocumentInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @context.delete()
            end
            
            ##
            # Update the DocumentInstance
            # @param [Hash] data The data
            
            # @return [DocumentInstance] Updated DocumentInstance
            def update(data: nil)
              @context.update()
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Sync.DocumentInstance #{context}>"
            end
          end
        end
      end
    end
  end
end