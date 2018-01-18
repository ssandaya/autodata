# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require "rubygems"
require "net/http"
require "uri"

def download(_url, _download_path = '')
  url = URI.parse _url
  http_object = Net::HTTP.new(url.host, url.port)
  http_object.use_ssl = true if (url.scheme == "https" || url.port == 443)

  http_object.start.request_get(url.path) do |response|
  start_time = Time.now
  response["Content-Disposition"] =~ /^.+?filename=”(.+?)"$/
  file_name = $1
  file = open(_download_path + file_name, 'wb')
  length = response['Content-Length'].to_i
  response.read_body do |fragment|
    file.write(fragment)
    done = (done || 0) + fragment.length
    progress = done.quo(length) * 100
    end
    file.close
    file_size = File.size(_download_path + file_name)/1024.0/1024.0
    puts "-"*80
#    puts "Download time – #{(Time.now – start_time)}"
#    puts "Download speed – #{file_size/(Time.now – start_time)} MB/s"
    puts "-"*80
  end
end