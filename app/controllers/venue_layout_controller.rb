class VenueLayoutController < ApplicationController

  layout "venue", except: [:index, :new]
end