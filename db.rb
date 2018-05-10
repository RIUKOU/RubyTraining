require 'sqlite3'

class Db
  def db_create
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL)
      create table if not exists book
      (name text, price integer)
      SQL
    end
    puts "テーブル作成完了"
  end

  def db_insert(_name, _price)
    tmp = {name: _name, price: _price}
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL, tmp)
      insert into book (name, price) VALUES
        (:name, :price)
      SQL
    end
    puts "登録完了"
    find
  end

  def db_select
    ret = []
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL){|row| ret << row.join(" ")}
      select name, price from book
      where price >= 10000
      SQL
    end
    puts "10000円以上"
    puts ret.map{|line| line + "\n"}.join

    ret = []
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL){|row| ret << row.join(" ")}
      select name, price from book
      where name like '%楽しい%'
      SQL
    end
    puts "<楽しい>が含まれる"
    puts ret.map{|line| line + "\n"}.join
  end

  def db_sort
    ret = []
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL){|row| ret << row.join(" ")}
      select name, price from book
      order by name asc
      SQL
    end
    puts "Name 昇順"
    puts ret.map{|line| line + "\n"}.join

    ret = []
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL){|row| ret << row.join(" ")}
      select name, price from book
      order by price desc
      SQL
    end
    puts "Price 降順"
    puts ret.map{|line| line + "\n"}.join
  end

  def db_update(_name, _price)
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL, _price, _name)
      update book set price = ?
      where name = ?
      SQL
    end
    puts "更新後"
    find
  end

  def find
    ret = []
    SQLite3::Database.open("book.db") do |db|
      db.execute(<<-SQL){|row| ret << row.join(" ")}
      select name, price from book
      SQL
    end
    puts ret.map{|line| line + "\n"}.join
  end
end

db = Db.new
db.db_create
db.db_insert("楽しいRuby", 2600)
db.db_insert("優しいRuby", 13000)
db.db_insert("楽しいC", 50000)
db.db_insert("優しいC", 1000)
db.db_select
db.db_sort
db.db_update("楽しいRuby", 2500)
