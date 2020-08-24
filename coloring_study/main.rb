def input_subject
  print "学習項目を入力してください > "
  gets.chomp
end

def input_time
  print "学習時間を入力してください > "
  gets.chomp.delete("^0-9").to_i
end

def push_info(lists, subject, time)
  if lists.any? { |hash| hash.value?(subject) }
    lists.each do |hash|
      hash[:time] += time
      break
    end
  else
    lists.push({ subject: subject, time: time })
  end
end

def print_lists(lists)
  puts "学習記録\n\n"
  lists.each do |hash|
    check_mark = "■ " * (hash[:time] / 15)
    puts "#{hash[:subject]} #{check_mark}"
  end
end

# 実行パート
lists = []
loop do
  puts "今日はどこの項目を何時間勉強しましたか？"

  subject = input_subject
  time = input_time

  push_info(lists, subject, time)
  print_lists(lists)
end