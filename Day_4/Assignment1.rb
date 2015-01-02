module MyFileModule

  class File
    attr_accessor :path
    def initialize (path)
        @path = path
    end
    def create_file
      file = ::File.new(path,'w')
      file.close
    end
    def edit_file (content)
      file = ::File.new(@path,'a')
      file.write(content)
      file.close
    end
    def delete_file
      begin
      ::File.delete(@path)
      rescue => e
        return "File Error : "+e
      end
    end
  end

end

puts " Enter file path "
path = gets

f = MyFileModule::File.new path
f.create_file
#f.edit_file("Hello")
#f.delete_file