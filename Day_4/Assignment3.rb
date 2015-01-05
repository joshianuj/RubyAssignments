
class SubtitleShift
  attr_accessor :filepath
  def initialize filepath
    @filepath = filepath
  end
  def shift diff
    begin
      file = File.new(@filepath,"r")
    rescue => e
      puts e
      return false
    end
    outfile = File.new("output.srt","w")
    while !file.eof?
      line = file.readline()
      if(line.include?("-->"))
        time = line.split("-->")
        (0...2).each do |i|
          #split time
          brokentime = split_time(time[i])
          #make the shift
          brokentime = shift_time brokentime,diff
          #prepare the new time
          line = "#{brokentime[0].to_i}:#{brokentime[1].to_i}:#{brokentime[2].to_i},#{brokentime[3].to_i} "
          if(i==0)
            line << "--> "
          end
          #write to new file
          outfile.print(line)
          line= ""
        end
      end
      outfile.puts(line)
    end
    file.close
    outfile.close
  end

  private
  def split_time time
    brokentime = time.split(":")
    temp = brokentime[2].split","
    brokentime.delete_at(2)
    brokentime << temp[0]
    brokentime << ((temp[1].split("\n"))[0].split(" "))[0]
    brokentime
  end
  def shift_time brokentime,diff
    x = 3
    difference = diff
    check = false
    while (check == false)
      brokentime[x] = brokentime[x].to_f
      brokentime[x] += difference
      if(x==3)
        if (brokentime[x]<0)
          difference = (brokentime[x]/1000)
          brokentime[x] =  brokentime[x]%1000
        elsif(brokentime[x]<1000)
          check = true
        else
          difference = (brokentime[x]/1000)
          brokentime[x] =  brokentime[x]%1000
        end
      elsif(x==0)
        check = true
      else
        if (brokentime[x]<0)
          difference = (brokentime[x]/60)
          brokentime[x] =  0
        elsif(brokentime[x]<60)
          check = true
        else
          difference = (brokentime[x]/60)
          brokentime[x] =  brokentime[x]%60
        end
      end
      x-=1
    end
    return brokentime
  end

end

def main
  puts "Enter filepath"
  path = gets().chomp
  ss = SubtitleShift.new(path)
  #path = "subtitle.srt"
  puts "Enter timeshift in ms"
  begin
    ip = Integer(gets().chomp)
  rescue => e
    puts e
    return false
  end
  begin
    ss.shift ip
    puts "Success"
  rescue => e
    puts e
    false
  end
end

main
