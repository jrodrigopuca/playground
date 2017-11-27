=begin
use Rack::Static,
:urls => ["/images", "/js", "/css"],
:root => "public"

run lambda { |env|
[
  200,
  {
    'Content-Type'  => 'text/html',
    'Cache-Control' => 'public, max-age=86400'
  },
  File.open('public/index.html', File::RDONLY)
]
}
=end
map "/" do
    use Rack::Static, urls: [""],
                      root: File.expand_path('public'),
                      index: 'index.html'
    run lambda {}
  end