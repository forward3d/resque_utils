require 'resque_utils/version'

module ResqueUtils
  
  def self.requeue_all
    count = Resque::Failure.count-1
    count.downto(0).each { |i| Resque::Failure.requeue(i) }
    puts "#{count} jobs requeued"
  end
  
  def self.remove_all
    count = Resque::Failure.count-1
    count.downto(0).each { |i| Resque::Failure.remove(i) }
    puts "#{count} jobs removed"
  end
  
  def self.requeue_specific(exception)
    count = 0
    (Resque::Failure.count-1).downto(0).each { |i|
      if Resque::Failure.all(i)['exception'] == exception
        Resque::Failure.requeue(i)
        count += 1
      end
    }
    puts "#{count} jobs requeued"
  end
  
  def self.remove_specific(exception)
    count = 0
    (Resque::Failure.count-1).downto(0).each { |i|
      if Resque::Failure.all(i)['exception'] == exception
        Resque::Failure.remove(i)
        count += 1
      end
    }
    puts "#{count} jobs removed"
  end
  
end
