namespace :db do
  desc 'Drop, create, load schema and then then seed the development database'
  task reseed: ['db:development:set_env', 'db:drop', 'db:create',
                'db:schema:load', 'db:seed'] do
    puts 'Reseeding completed.'
  end

  namespace :development do
    desc 'Override environement to be development'
    task :set_env do
      Rails.env = 'development'
    end
  end
end
