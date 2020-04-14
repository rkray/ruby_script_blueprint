#!/usr/bin/ruby
# Author: René Kray <rene@kray.info>
# Date:   2020-04-14

require 'optparse'
require 'pp'

class RubyScriptBlueprint
    attr_accessor :conf, :option

    def initialize
        @conf={}
        # set defaults
        @conf["configfile"]=ENV["HOME"]+"/.config/"+File.basename($0)+"/preferences"

    end

    def run
        # check for options and configurations
        raise "please set option" if @option.nil?
        raise "please set config" if @conf["propperty"].nil?

        # Enter main code here

        rescue RuntimeError => e
            puts e.message
    end

    def option_parser
        option_parser = OptionParser.new do |opts|
            opts.banner = "Usage: #{$0} [options]"
            opts.on( "-d", "--debug", "enable debug mode") do
                @conf[:debug] = true
            end
            opts.on( "-v", "--verbose", "enable verbose logging") do
                @conf[:debug] = true
            end
            opts.on( "-f", "--flag", "set flag") do
                @conf[:flag] = true
            end
            opts.on( "-o", "--option argument", "option with argument") do |argument|
                @option=argument
            end

        end
        option_parser.parse!
    end

    private

    def function1(arg1)
        # do things
        return true
        rescue => e
            stderr.puts e.message unless @debug.nil?
            return false
    end
end

# don't run this part neither load from another script nor irb
if $0 == __FILE__
    main=RubyScriptBlueprint.new
    main.option_parser
    main.run
end


