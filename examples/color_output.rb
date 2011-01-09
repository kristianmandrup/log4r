$: << File.join("..","lib")

require 'rubygems'

require 'log4r'
include Log4r

Logger.global.level = ALL
formatter = PatternFormatter.new(:pattern => "%l - %m - %c")

ColorOutputter.new 'color', {:colors => {:info => {:color => :light_blue, :background => :red}, :debug => :light_blue }}

Logger.new('color_logger', DEBUG).add('color')


def do_logging(log)
  puts "--"
  log.debug "This is debug"
  log.info "This is info"
  log.warn "This is warn"
  log.error "This is error"
  log.fatal "This is fatal"
end

# This logger is configured to log at FATAL, and it does
do_logging Logger['color_logger']