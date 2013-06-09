# encoding: utf-8

require 'csv'
require 'MeCab'

class Analyze
  
  CSV_DIR = './data/'

  def initialize
  end

  def import_csv
  end

  def key_extraction(file)
    data = CSV.read(CSV_DIR + file, encoding: 'utf-8')
    mecab = MeCab::Tagger.new()
    words = []

    n = 1
    data.each do |data|
      text = mecab.parse(data[0]).force_encoding('utf-8')
      puts text
      line = text.split(/\n/)  ##each_line

      line.each do |line|
        if line != 'EOS'
          word = line.split(/\t/)[0]
          words[n] = [] 
          words[n] << word
          words[n] << data[1]
          words[n] << data[2]
          n += 1 
        end
      end
    end
p words

  end

  def aaa ##(3)の機能
  end
  
  def render ##データを表示するhtmlを生成
  end
  
  def export_csv(file) ##CSVで集計したデータをエクスポート
  end

end


analyze = Analyze.new()

analyze.key_extraction('20130501.csv')
