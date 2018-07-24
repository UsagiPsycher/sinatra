require 'csv'

class Gossip
attr_accessor :author, :content , :a, :b

    def initialize(author, content)
        @author = author
        @content = content
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
          end
    end

    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end

    def self.find(row)
        CSV.foreach("./db/gossip.csv").drop(row.to_i-1).take(1).each { |ligne| 
             a =ligne[0]
             b =ligne[1] 
             ligne << row
             puts a
             puts b
            }
    end

end