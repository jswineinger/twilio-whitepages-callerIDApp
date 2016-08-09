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
          class SyncMapList < ListResource
            ##
            # Initialize the SyncMapList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            
            # @return [SyncMapList] SyncMapList
            def initialize(version, service_sid: nil)
              super(version)
              
              # Path Solution
              @solution = {
                  service_sid: service_sid
              }
              @uri = "/Services/#{@solution[:service_sid]}/Maps"
            end
            
            ##
            # Retrieve a single page of SyncMapInstance records from the API.
            # Request is executed immediately.
            # @param [String] unique_name The unique_name
            
            # @return [SyncMapInstance] Newly created SyncMapInstance
            def create(unique_name: nil)
              data = {
                  'UniqueName' => unique_name,
              }
              
              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )
              
              return SyncMapInstance.new(
                  @version,
                  payload,
                  service_sid: @solution['service_sid'],
              )
            end
            
            ##
            # Lists SyncMapInstance records from the API as a list.
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
            # Streams SyncMapInstance records from the API as an Enumerable.
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
            # When passed a block, yields SyncMapInstance records from the API.
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
            # Retrieve a single page of SyncMapInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            
            # @return [Page] Page of SyncMapInstance
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
              return SyncMapPage.new(@version, response, @solution)
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Sync.SyncMapList>'
            end
          end
        
          class SyncMapPage < Page
            ##
            # Initialize the SyncMapPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] service_sid The service_sid
            
            # @return [SyncMapPage] SyncMapPage
            def initialize(version, response, solution)
              super(version, response)
              
              # Path Solution
              @solution = solution
            end
            
            ##
            # Build an instance of SyncMapInstance
            # @param [Hash] payload Payload response from the API
            
            # @return [SyncMapInstance] SyncMapInstance
            def get_instance(payload)
              return SyncMapInstance.new(
                  @version,
                  payload,
                  service_sid: @solution['service_sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Sync.SyncMapPage>'
            end
          end
        
          class SyncMapContext < InstanceContext
            ##
            # Initialize the SyncMapContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            
            # @return [SyncMapContext] SyncMapContext
            def initialize(version, service_sid, sid)
              super(version)
              
              # Path Solution
              @solution = {
                  service_sid: service_sid,
                  sid: sid,
              }
              @uri = "/Services/#{@solution[:service_sid]}/Maps/#{@solution[:sid]}"
              
              # Dependents
              @sync_map_items = nil
            end
            
            ##
            # Fetch a SyncMapInstance
            # @return [SyncMapInstance] Fetched SyncMapInstance
            def fetch
              params = {}
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return SyncMapInstance.new(
                  @version,
                  payload,
                  service_sid: @solution['service_sid'],
                  sid: @solution['sid'],
              )
            end
            
            ##
            # Deletes the SyncMapInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              return @version.delete('delete', @uri)
            end
            
            ##
            # Access the sync_map_items
            # @return [SyncMapItemList] SyncMapItemList
            def sync_map_items(key=:unset)
              if key != :unset
                return SyncMapItemContext.new(
                    @version,
                    @solution[:service_sid],
                    @solution[:sid],
                    key,
                )
              end
              
              unless @sync_map_items
                @sync_map_items = SyncMapItemList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    map_sid: @solution[:sid],
                )
              end
              
              @sync_map_items
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Sync.SyncMapContext #{context}>"
            end
          end
        
          class SyncMapInstance < InstanceResource
            ##
            # Initialize the SyncMapInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            
            # @return [SyncMapInstance] SyncMapInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'unique_name' => payload['unique_name'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'url' => payload['url'],
                  'links' => payload['links'],
                  'revision' => payload['revision'],
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
            
            # @return [SyncMapContext] SyncMapContext for this SyncMapInstance
            def context
              unless @instance_context
                @instance_context = SyncMapContext.new(
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
            
            def links
              @properties['links']
            end
            
            def revision
              @properties['revision']
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
            # Fetch a SyncMapInstance
            # @return [SyncMapInstance] Fetched SyncMapInstance
            def fetch
              @context.fetch()
            end
            
            ##
            # Deletes the SyncMapInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @context.delete()
            end
            
            ##
            # Access the sync_map_items
            # @return [sync_map_items] sync_map_items
            def sync_map_items
              @context.sync_map_items
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Sync.SyncMapInstance #{context}>"
            end
          end
        end
      end
    end
  end
end