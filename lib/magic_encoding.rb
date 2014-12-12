# coding: utf-8

# A simple library to prepend magic comments for encoding to multiple ".rb" files

module AddMagicComment

  # Options :
  # - paths
  def self.process(*paths)

    # defaults
    paths.push [Dir.pwd] if paths.empty?

    encoding = "coding: utf-8\n"
    default_comment = '# {encoding}'

    # TODO : add options for recursivity (and application of the script to a single file)
    extensions = {
      '.rb' => default_comment,
      '.rake' => default_comment,
      '.haml' => '-# {encoding}',
    }

    paths.each do |path|
      path = Pathname.new path
      if path.file?
        files.push path
      elsif path.directory?
        files += Dir.glob Pathname.join('**', "*#{extensions.keys}")
      end
    end

    default_comment.sub! '{encoding}', encoding
    extensions.each_key do |key|
      extensions[key].sub! '{encoding}', encoding
    end

    files.each do |filename|
      file = File.new(filename, "r+")
      magic_comment = extensions[ File.extname(file) ] || default_comment
      lines = file.readlines

      # remove current encoding comment(s)
      while lines[0].match(/^-?# ?(-\*-)? ?(en)?coding/)
        lines.shift
      end

      # set current encoding
      lines.unshift comment_style.sub('{text}', prefix)

      file.pos = 0
      file.write lines.join
      file.close
    end

    puts "Magic comments set for #{files.length} source files"
  end
end
