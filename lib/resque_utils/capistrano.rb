require 'resque_utils'

Capistrano::Configuration.instance(:must_exist).load do
  namespace :deploy do
    desc "Checks that the packages outlined in your PackageFile are installed on the remote server"
    task :captitude, :except => { :no_release => true } do
      
    end
  end
end