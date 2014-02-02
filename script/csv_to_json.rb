#!/usr/bin/env ruby
require 'json'

desc = {}
headers = gets
headers = headers.strip.split(',')

desc['x'] = headers.shift
desc['y'] = headers
desc['y_label'] = "load (kW)"
desc['datetime_format'] = "%m/%d  %H:%M:%S"

keys = []
headers.length.times do |i|
  keys << "y#{i}"
end

data = []
while line = gets
  values = line.strip.split(',')
  datum  = {}
  datum['x'] = values.shift
  keys.zip(values).each do |(k, v)|
    datum[k] = v
  end
  data << datum
  break if data.length == 200
end

puts({'desc' => desc, 'data' => data}.to_json)
