require 'rack'
require_relative './HamlApp'

# Servir archivos estáticos desde source/ (css/js/img)
use Rack::Static,
	urls: [
		'/stylesheets',
		'/javascripts',
		'/images'
	],
	root: File.expand_path('source', __dir__)

# Definir rutas: path, view (archivo haml), layout
routes = [
	{ path: '/', view: 'index.haml', layout: 'layouts/layout.haml' },
	{ path: '/about', view: 'sections/section1', layout: 'layouts/layout' },
	{ path: '/raw', view: 'partials/header.haml', layout: nil }
]

run HamlApp.new(routes)
