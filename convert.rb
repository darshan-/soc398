#!/bin/ruby

type = nil
cur = ''
capturing = false

$stdin.readlines.each do |line|
  #puts line
  if line =~ />,summary\(lm\(od\$([a-z]+),/
    type = $1
  end

  if line =~ /\(Intercept\)/
    capturing = true
  end

  if line =~ /---,,---/
    capturing = false
    File.open(type + '.csv', 'w') do |f|
      f.write(cur)
    end
    cur = ''
  end

  if capturing
    parts = line.split(',')
    c = parts.last[0]
    if c != '*' && c != '.'
      parts[2] = ''
      line = parts.join(',') + "\n"
    end

    cur << line
  end
end
