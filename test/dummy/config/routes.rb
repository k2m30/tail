Rails.application.routes.draw do

  mount Tail::Engine => "/tail"
end
