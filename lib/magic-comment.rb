# coding: utf-8
# A simple library to prepend magic comments for encoding to multiple ".rb" files
require 'pathname'

class MagicComment
  attr_accessor :paths, :filelist, :encoding, :template, :extensions, :magic_comment

  # options:
  #   extensions: additional extensions
  #   encoding: difference encoding if you want
  def initialize(*args, options = {})
    self.paths = args.empty? ? [Dir.pwd] : args.flatten

    self.encoding = options[:encoding] || 'utf-8'
    self.template= "# coding: {encoding}\n"

    self.extensions = %w(.rb .rake)
    self.extensions += options[:extensions] if options[:extensions].instance_of? Array

    generate_filelist(paths)
    self.magic_comment = template.sub '{encoding}', encoding
  end

  def run!
    filelist.each do |filename|
      file = File.new(filename, "r+")
      lines = file.readlines

      # remove current encoding comment(s)
      while lines[0].match(/)?coding/)
        lines.shift
      end

      # set current encoding
      lines.unshift magic_comment

      body = lines.join

      file.pos = 0
      file.write body
      file.truncate(body.bytesize)
      file.close
    end
    puts "Magic comments set for #{files.length} source files"
  end

  private

  def generate_filelist(*paths)
    self.filelist = paths.each_with_object([]) do |path, files|
      path = Pathname.new path
      if path.file?
        files.push path
      elsif path.directory?
        files += Dir.glob path.join('**', "*{#{extensions.join ','}}")
      end
    end
  end

  def substitution(obj)
    if obj.instance_of? Hash
      obj.each_with_object do |(key, value), hash|
        hash[key] = substitution(value)
      end
    else
    end
  end
end
