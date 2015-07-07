class EventsController < ApplicationController
	# layout 'event'
	#layout 'magazine'
	layout 'standard'

	def show
		@event =  Imodec::Event.find(params[:id])
	end
end
