require 'yaml'
require 'pp'
require 'ap'

$is_first = 1

def iterate(obj)

  obj.each do |k,v|

    if $is_first == 1
      print(k, "\n")
      $is_first = 0
    else
      print(k, "\t")
    end

    if v.is_a?(Hash)
      iterate(v)
    elsif v.is_a?(Array)
      v.each do |i|
        if i.is_a?(Hash)
          iterate(i)
        else
          print(i, "\n")
        end
      end
    else
      print(v, "\n")
    end
  end
end


thing = YAML.load_file(ARGV[0])
puts("file\t"+ARGV[0])
iterate(thing)

#pp thing
#puts thing.inspect

