require 'yaml'
require 'pp'
require 'ap'

def iterate(obj)
  obj.each do |k,v|
    print(k, ": ")
    if v.is_a?(Hash)
      iterate(v)
    elsif v.is_a?(Array)
      v.each do |i|
        if i.is_a?(Hash)
          iterate(i)
        else
        puts(i)
        end
      end
    else
      puts(v)
    end
  end
end

thing = YAML.load_file('age_verification.yml')
iterate(thing)

#ap thing
#puts thing.inspect

