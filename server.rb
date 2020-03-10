require 'sinatra'
require "sinatra/streaming"
require 'byebug' if ENV['BYEBUG']

helpers do
  def stream_command(command)
    content_type :text

    stream do |out|
      IO.popen command do |io|
        io.each do |line|
          break if out.closed?
          puts line unless ENV['QUIET_SERVER']
          out << line
        end
      end
    end
  end
end

get '/favicon.ico' do
end

get '/' do
  content_type :text
  'OK'
end

get '/help' do
  content_type :text
  `stress --help`
end

get '/raw/:options' do
  options = params[:options].gsub '+', ' '
  stream_command "stress #{options}"
end

get '/stress' do
  verbose   = params[:v] || params[:verbose]
  quiet     = params[:q] || params[:quiet]
  dry_run   = params[:n] || params[:'dry-run'] || params[:dry_run]
  timeout   = params[:t] || params[:timeout]
  backoff   = params[:backoff]
  cpu       = params[:c] || params[:cpu]
  io        = params[:i] || params[:io]
  vm        = params[:m] || params[:vm]
  vm_bytes  = params[:'vm-bytes'] || params[:vm_bytes]
  vm_stride = params[:'vm-stride'] || params[:vm_stride]
  vm_hang   = params[:'vm-hang'] || params[:vm_hang]
  vm_keep   = params[:'vm-keep'] || params[:vm_keep]
  hdd       = params[:d] || params[:hdd]
  hdd_bytes = params[:'hdd-bytes'] || params[:hdd_bytes]

  options = []
  options.push "--verbose" if verbose
  options.push "--quiet"   if quiet
  options.push "--dry-run" if dry_run
  options.push "--timeout #{timeout}" if timeout
  options.push "--backoff #{backoff}" if backoff
  options.push "--cpu #{cpu}" if cpu
  options.push "--io #{io}" if io
  options.push "--vm #{vm}" if vm
  options.push "--vm-bytes #{vm_bytes}" if vm_bytes
  options.push "--vm-stride #{vm_stride}" if vm_stride
  options.push "--vm-hang #{vm_hang}" if vm_hang
  options.push "--vm-keep" if vm_keep
  options.push "--hdd #{hdd}" if hdd
  options.push "--hdd-bytes #{hdd}" if hdd_bytes

  options = options.join ' '
  stream_command "stress #{options}"
end

