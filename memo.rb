require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

if memo_type == 1
    puts "新規メモを作成します。拡張子を除いたファイルを入力してください"
    file_name = gets.chomp
    
    puts "メモしたい内容を記入してください"
    puts "完了したらCtrl + Dを押します"
    input_memo = STDIN.read
    memo = input_memo.chomp
   
    
    CSV.open("#{file_name}.csv", "w") do |csv|
    csv.puts ["#{memo}"]
    
   end
elsif memo_type == 2
   puts "既存メモを編集します。拡張子を除いたファイルを入力してください"
   file_name = gets.chomp
   
    puts "編集したい内容を記入してください"
    puts "完了したらCtrl + Dを押します"
    edit_memo = STDIN.read
    memo = edit_memo.chomp
    
    CSV.open("#{file_name}.csv", "a") do |csv|
    csv.puts ["#{memo}"]
    end

end
