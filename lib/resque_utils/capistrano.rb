require 'resque_utils'

Capistrano::Configuration.instance(:must_exist).load do
  
  namespace :resque do
    
    set :resque_pre, "cd #{current_path} && RAILS_ENV=#{environment} bundle exec rails runner"
    
    namespace :failed do

      desc "Requeue all failed jobs"
      task :requeue_all do
        run "#{resque_pre} \"(Resque::Failure.count-1).downto(0).each { |i| Resque::Failure.requeue(i) }\""
      end

      desc "Remove all failed jobs"
      task :remove_all do
        run "#{resque_pre} \"(Resque::Failure.count-1).downto(0).each { |i| Resque::Failure.remove(i) }\""
      end

      desc "Requeue specific failed jobs (specify with '--set exception=SomeErrorHere)"
      task :requeue_specific do
        if exists?(:exception)
          run "#{resque_pre} \"(Resque::Failure.count-1).downto(0).each { |i| ex = Resque::Failure.all(i)['exception']; if ex == '#{exception}' then Resque::Failure.requeue(i); end }\""
        else
          raise ArgumentError, "No exception was specified, use '--set exception=SomeErrorHere'"
        end
      end

      desc "Remove specific failed jobs (specify with '--set exception=SomeErrorHere)"
      task :remove_specific do
        if exists?(:exception)
          run "#{resque_pre} \"(Resque::Failure.count-1).downto(0).each { |i| ex = Resque::Failure.all(i)['exception']; if ex == '#{exception}' then Resque::Failure.remove(i); end }\""
        else
          raise ArgumentError, "No exception was specified, use '--set exception=SomeErrorHere'"
        end
      end

    end
  end
  
end