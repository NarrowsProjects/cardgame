require 'fileutils'
require 'optparse'

unless File.exist?('config/application.rb')
  puts 'This script must be run from the root of a Rails project.'
  exit 1
end

if ARGV.length != 1
  puts 'Usage: ./generate_scaffold <table_name>'
  exit 1
end

def singularize(word)
  if word.end_with?('ies')
    "#{word[0..-4]}y"
  elsif word.end_with?('s') && !word.end_with?('ss')
    word[0..-2]
  else
    word
  end
end

table_name = ARGV[0]
singular_table_name = singularize(table_name)
migration_file_pattern = /\d+_create_#{table_name}\.rb/
migrations_dir = File.join('db', 'migrate')

# Search for the migration file
migration_file = Dir.glob(File.join(migrations_dir, '*.rb')).find do |file|
  File.basename(file) =~ migration_file_pattern
end

unless migration_file
  puts "Migration file for table '#{table_name}' not found."
  exit 1
end

# Extract columns and types from the migration file
columns = []
File.readlines(migration_file).each do |line|
  next unless line.strip =~ /^t\.(\w+)\s+:([a-z_]+)/

  type = Regexp.last_match(1)
  column = Regexp.last_match(2)
  columns << "#{column}:#{type}"
end

if columns.empty?
  puts "No columns found in migration file '#{migration_file}'."
  exit 1
end

# Generate the scaffold command
scaffold_command = [
  'rails generate scaffold',
  singular_table_name.capitalize,
  columns.join(' '),
  '--skip-migration',
  '--skip-model',
  '--skip-collision-check'
].join(' ')

puts "Executing: #{scaffold_command}"

# Execute the scaffold command
system(scaffold_command)
