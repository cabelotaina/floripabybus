class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
	before_filter :set_headers

	  def set_headers
		      headers['Access-Control-Allow-Origin'] = 'http://localhost:9000'
		          headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
			      headers['Access-Control-Allow-Headers'] = '*,X-Requested-With,Content-Type,If-Modified-Since,If-None-Match'
			          headers['Access-Control-Max-Age'] = '86400'
				    end
end
