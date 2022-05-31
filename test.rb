require 'byebug'

# threads = 5.times.map do
#   Thread.new do
#     # 100000.times do
#     #   mutex.synchronize do
#     #     counters.map! { |counter| counter + 1 }
#     #   end
#     # end
#
#   end
# end
# mutex = Mutex.new
# #mutex.lock
#
# #threads = (1..5).map do |n|
#   #Thread.new do
#     #mutex.synchronize do
#     # sleep 1
#     #byebug
#     # p self
#     #end
#     # sleep 1
# # p "v2: #{n}"
#   #end
#   #end
#
# t = Thread.new do
#   Thread.current[:name] = 'test'
#   Thread.stop
#     p 'byebug'
# end
#
# t2 = Thread.new do
#   Thread.current[:name] = 'test'
#   p 'byebug2'
#   t.run
#   Thread.stop
# end

#p 'sdfs'
# t2.run
# []

#p 'sdfs'



#t.join
#p threads.each(&:join)
#p mutex
#
#
#






# class DoorLock
#   def initialize(locked)
#     @locked = locked
#   end
#
#   def open?
#     !@locked
#   end
#
#   def unlock!
#     unless open?
#       puts "Opening the door!"
#       @locked = false
#     end
#   end
# end
#
#
#
# class DoorLock
#   def initialize(locked)
#     @locked = locked
#     @mutex = Mutex.new
#   end
#
#   def open?(n)
#     p n
#     @mutex.synchronize { !@locked }
#   end
#
#   def unlock!
#     unless open?('unlock n')
#       @mutex.synchronize do
#         puts "Opening the door!"
#         @locked = false
#       end
#     end
#   end
# end
#
# door_lock = DoorLock.new(true)
#
# (1..5).map do |n|
#   Thread.new do
#     unless door_lock.open?(n)
#       door_lock.unlock!
#     end
#   end
# end.each(&:join)
#
# p door_lock
#
# require 'thread'
#
# queue = Queue.new
#
# producer = Thread.new do
#   5.times do |i|
#     sleep rand(i) # simulate expense
#     queue << i
#     puts "#{i} produced"
#   end
# end
#
# consumer = Thread.new do
#   5.times do |i|
#     value = queue.pop
#     sleep rand(i/2) # simulate expense
#     puts "consumed #{value}"
#   end
# end
#
# consumer.join
#

# def fibonacci( n )
#   byebug
#   return  n  if ( 0..1 ).include? n
#   ( fibonacci( n - 1 ) + fibonacci( n - 2 ) )
# end
# puts fibonacci( 5 )
class Ts
  def initialize
    @mutex = Mutex.new
    #@mutex.synchronize { @counters }
  end

  def counters_with_mutex
    mutex = Mutex.new
    counters = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    5.times.map do
      Thread.new do
        100000.times do
          mutex.synchronize do
            counters.map! { |counter| counter + 1 }
          end
        end
      end
    end.each(&:join)
    counters.inspect
  end
  def counters_without_mutex
    @counters = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    5.times.map do
      Thread.new do
        100000.times do
          @counters.map! { |counter| counter + 1 }
        end
      end
    end.each(&:join)
    @counters.inspect
  end
end

puts Ts.new.counters_with_mutex
# => [500000, 500000, 500000, 500000, 500000, 500000, 500000, 500000, 500000, 500000]
puts Ts.new.counters_without_mutex