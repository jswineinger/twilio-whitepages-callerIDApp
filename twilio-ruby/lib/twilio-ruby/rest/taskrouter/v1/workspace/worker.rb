##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class WorkerList < ListResource
            ##
            # Initialize the WorkerList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            
            # @return [WorkerList] WorkerList
            def initialize(version, workspace_sid: nil)
              super(version)
              
              # Path Solution
              @solution = {
                  workspace_sid: workspace_sid
              }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers"
              
              # Components
              @statistics = nil
            end
            
            ##
            # Lists WorkerInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] activity_name The activity_name
            # @param [String] activity_sid The activity_sid
            # @param [String] available The available
            # @param [String] friendly_name The friendly_name
            # @param [String] target_workers_expression The target_workers_expression
            # @param [String] task_queue_name The task_queue_name
            # @param [String] task_queue_sid The task_queue_sid
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            
            # @return [Array] Array of up to limit results
            def list(activity_name: nil, activity_sid: nil, available: nil, friendly_name: nil, target_workers_expression: nil, task_queue_name: nil, task_queue_sid: nil, limit: nil, page_size: nil)
              self.stream(
                  activity_name: activity_name,
                  activity_sid: activity_sid,
                  available: available,
                  friendly_name: friendly_name,
                  target_workers_expression: target_workers_expression,
                  task_queue_name: task_queue_name,
                  task_queue_sid: task_queue_sid,
                  limit: limit,
                  page_size: page_size
              ).entries
            end
            
            ##
            # Streams WorkerInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] activity_name The activity_name
            # @param [String] activity_sid The activity_sid
            # @param [String] available The available
            # @param [String] friendly_name The friendly_name
            # @param [String] target_workers_expression The target_workers_expression
            # @param [String] task_queue_name The task_queue_name
            # @param [String] task_queue_sid The task_queue_sid
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(activity_name: nil, activity_sid: nil, available: nil, friendly_name: nil, target_workers_expression: nil, task_queue_name: nil, task_queue_sid: nil, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)
              
              page = self.page(
                  activity_name: activity_name,
                  activity_sid: activity_sid,
                  available: available,
                  friendly_name: friendly_name,
                  target_workers_expression: target_workers_expression,
                  task_queue_name: task_queue_name,
                  task_queue_sid: task_queue_sid,
                  page_size: limits['page_size'],
              )
              
              @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
            end
            
            ##
            # When passed a block, yields WorkerInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] activity_name The activity_name
            # @param [String] activity_sid The activity_sid
            # @param [String] available The available
            # @param [String] friendly_name The friendly_name
            # @param [String] target_workers_expression The target_workers_expression
            # @param [String] task_queue_name The task_queue_name
            # @param [String] task_queue_sid The task_queue_sid
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
            # Retrieve a single page of WorkerInstance records from the API.
            # Request is executed immediately.
            # @param [String] activity_name The activity_name
            # @param [String] activity_sid The activity_sid
            # @param [String] available The available
            # @param [String] friendly_name The friendly_name
            # @param [String] target_workers_expression The target_workers_expression
            # @param [String] task_queue_name The task_queue_name
            # @param [String] task_queue_sid The task_queue_sid
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            
            # @return [Page] Page of WorkerInstance
            def page(activity_name: nil, activity_sid: nil, available: nil, friendly_name: nil, target_workers_expression: nil, task_queue_name: nil, task_queue_sid: nil, page_token: nil, page_number: nil, page_size: nil)
              params = {
                  'ActivityName' => activity_name,
                  'ActivitySid' => activity_sid,
                  'Available' => available,
                  'FriendlyName' => friendly_name,
                  'TargetWorkersExpression' => target_workers_expression,
                  'TaskQueueName' => task_queue_name,
                  'TaskQueueSid' => task_queue_sid,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              }
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return WorkerPage.new(@version, response, @solution)
            end
            
            ##
            # Retrieve a single page of WorkerInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name The friendly_name
            # @param [String] activity_sid The activity_sid
            # @param [String] attributes The attributes
            
            # @return [WorkerInstance] Newly created WorkerInstance
            def create(friendly_name: nil, activity_sid: nil, attributes: nil)
              data = {
                  'FriendlyName' => friendly_name,
                  'ActivitySid' => activity_sid,
                  'Attributes' => attributes,
              }
              
              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )
              
              return WorkerInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution['workspace_sid'],
              )
            end
            
            ##
            # Access the statistics
            # @return [WorkersStatisticsList] WorkersStatisticsList
            def statistics
              return WorkersStatisticsContext.new(
                  @version,
                  @solution[:workspace_sid],
              )
              
              @statistics ||= WorkersStatisticsList.new(
                  @version,
                  workspace_sid: @solution[:workspace_sid],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.WorkerList>'
            end
          end
        
          class WorkerPage < Page
            ##
            # Initialize the WorkerPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] workspace_sid The workspace_sid
            
            # @return [WorkerPage] WorkerPage
            def initialize(version, response, solution)
              super(version, response)
              
              # Path Solution
              @solution = solution
            end
            
            ##
            # Build an instance of WorkerInstance
            # @param [Hash] payload Payload response from the API
            
            # @return [WorkerInstance] WorkerInstance
            def get_instance(payload)
              return WorkerInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution['workspace_sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.WorkerPage>'
            end
          end
        
          class WorkerContext < InstanceContext
            ##
            # Initialize the WorkerContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            
            # @return [WorkerContext] WorkerContext
            def initialize(version, workspace_sid, sid)
              super(version)
              
              # Path Solution
              @solution = {
                  workspace_sid: workspace_sid,
                  sid: sid,
              }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/#{@solution[:sid]}"
              
              # Dependents
              @statistics = nil
            end
            
            ##
            # Fetch a WorkerInstance
            # @return [WorkerInstance] Fetched WorkerInstance
            def fetch
              params = {}
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return WorkerInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution['workspace_sid'],
                  sid: @solution['sid'],
              )
            end
            
            ##
            # Update the WorkerInstance
            # @param [String] activity_sid The activity_sid
            # @param [String] attributes The attributes
            # @param [String] friendly_name The friendly_name
            
            # @return [WorkerInstance] Updated WorkerInstance
            def update(activity_sid: nil, attributes: nil, friendly_name: nil)
              data = {
                  'ActivitySid' => activity_sid,
                  'Attributes' => attributes,
                  'FriendlyName' => friendly_name,
              }
              
              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )
              
              return WorkerInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution['workspace_sid'],
                  sid: @solution['sid'],
              )
            end
            
            ##
            # Deletes the WorkerInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              return @version.delete('delete', @uri)
            end
            
            ##
            # Access the statistics
            # @return [WorkerStatisticsList] WorkerStatisticsList
            def statistics
              return WorkerStatisticsContext.new(
                  @version,
                  @solution[:workspace_sid],
                  @solution[:sid],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.WorkerContext #{context}>"
            end
          end
        
          class WorkerInstance < InstanceResource
            ##
            # Initialize the WorkerInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            
            # @return [WorkerInstance] WorkerInstance
            def initialize(version, payload, workspace_sid: nil, sid: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'activity_name' => payload['activity_name'],
                  'activity_sid' => payload['activity_sid'],
                  'attributes' => payload['attributes'],
                  'available' => payload['available'],
                  'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                  'date_status_changed' => Twilio.deserialize_iso8601(payload['date_status_changed']),
                  'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'sid' => payload['sid'],
                  'workspace_sid' => payload['workspace_sid'],
              }
              
              # Context
              @instance_context = nil
              @params = {
                  'workspace_sid' => workspace_sid,
                  'sid' => sid || @properties['sid'],
              }
            end
            
            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            
            # @return [WorkerContext] WorkerContext for this WorkerInstance
            def context
              unless @instance_context
                @instance_context = WorkerContext.new(
                    @version,
                    @params['workspace_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end
            
            def account_sid
              @properties['account_sid']
            end
            
            def activity_name
              @properties['activity_name']
            end
            
            def activity_sid
              @properties['activity_sid']
            end
            
            def attributes
              @properties['attributes']
            end
            
            def available
              @properties['available']
            end
            
            def date_created
              @properties['date_created']
            end
            
            def date_status_changed
              @properties['date_status_changed']
            end
            
            def date_updated
              @properties['date_updated']
            end
            
            def friendly_name
              @properties['friendly_name']
            end
            
            def sid
              @properties['sid']
            end
            
            def workspace_sid
              @properties['workspace_sid']
            end
            
            ##
            # Fetch a WorkerInstance
            # @return [WorkerInstance] Fetched WorkerInstance
            def fetch
              @context.fetch()
            end
            
            ##
            # Update the WorkerInstance
            # @param [String] activity_sid The activity_sid
            # @param [String] attributes The attributes
            # @param [String] friendly_name The friendly_name
            
            # @return [WorkerInstance] Updated WorkerInstance
            def update(activity_sid: nil, attributes: nil, friendly_name: nil)
              @context.update(
                  attributes: attributes,
                  friendly_name: friendly_name,
              )
            end
            
            ##
            # Deletes the WorkerInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @context.delete()
            end
            
            ##
            # Access the statistics
            # @return [statistics] statistics
            def statistics
              @context.statistics
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.WorkerInstance #{context}>"
            end
          end
        end
      end
    end
  end
end