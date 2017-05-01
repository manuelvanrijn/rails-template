# RSpec.describe 'Example tasks', type: :task do
#   describe '#task_one' do

#     before do
#       # Freeze time as task is time-sensitive
#       travel_to Time.zone.now
#     end

#     after { travel_back }

#     it 'ends gracefully' do
#       expect { invoke_task }.not_to raise_error
#     end

#     private

#     def invoke_task
#       task = Rake::Task['example:task_one']
#       # Ensure task is re-enabled, as rake tasks by default are disabled
#       # after running once within a process http://pivotallabs.com/how-i-test-rake-tasks/
#       task.reenable
#       task.invoke
#     end
#   end
# end
