# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dir.glob("#{Rails.root}/db/seed/*.yml").each do |filename|
  puts 'filename: ' + filename

  target_model = File.basename(filename, '.yml').classify.constantize
  puts 'model: ' + target_model.to_s

  File.open(filename) do |file_contents|
    yaml_contents = YAML.safe_load(file_contents)
    yaml_contents.each do |yaml_record|
      id = yaml_record['id']

      if target_model.find_by(id: id)
        puts 'id: ' + id.to_s + ' ... Skip create'
        next
      end

      puts 'id: ' + id.to_s + ' ... Create'
      target_model.create(yaml_record)
    end
  end
end
