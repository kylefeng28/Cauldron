require "optparse"
require "ostruct"

class Parser
  def self.parse(args)

    options = OpenStruct.new

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: cauldron <command> [options]"
  
      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options[:verbose] = v
      end

      opts.on_tail("-h", "--help", "Show help") do
        puts opts
        exit
      end

	  # FIXME: remove
      opts.on("-nNAME", "--name=NAME", "Name to say hello to") do |n|
        options.name = n
      end

      opts.on("-i", "--install=PKG", "Package to install") do |pkg|
        options.pkg = pkg
      end

    end # OptionParser.new()

    opt_parser.parse!(args)
	options

  end # parse()

end # class Parser

class CauldronHelpers

  #def is_running(process)
  #end

  #def in_path(program)
  #end

  #def exists(file)
  #end

  def package_install(pkg)
	  shell "apt-get install #{pkg}"
  end

  def package_purge(pkg)
	  shell "apt-get purge #{pkg}"
  end

end # class CauldronHelpers

# main
options = Parser.parse(ARGV)
