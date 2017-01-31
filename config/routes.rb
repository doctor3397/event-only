Rails.application.routes.draw do

  root 'home#index'
  get 'home/index'

  resources :locations do
    resources :events
  end

  get 'example/form' => 'example#form'
  resources :job_applications

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

=begin
Prefix Verb   URI Pattern                                       Controller#Action
               root GET    /                                                 home#index
         home_index GET    /home/index(.:format)                             home#index
    location_events GET    /locations/:location_id/events(.:format)          events#index
                    POST   /locations/:location_id/events(.:format)          events#create
 new_location_event GET    /locations/:location_id/events/new(.:format)      events#new
edit_location_event GET    /locations/:location_id/events/:id/edit(.:format) events#edit
     location_event GET    /locations/:location_id/events/:id(.:format)      events#show
                    PATCH  /locations/:location_id/events/:id(.:format)      events#update
                    PUT    /locations/:location_id/events/:id(.:format)      events#update
                    DELETE /locations/:location_id/events/:id(.:format)      events#destroy
          locations GET    /locations(.:format)                              locations#index
                    POST   /locations(.:format)                              locations#create
       new_location GET    /locations/new(.:format)                          locations#new
      edit_location GET    /locations/:id/edit(.:format)                     locations#edit
           location GET    /locations/:id(.:format)                          locations#show
                    PATCH  /locations/:id(.:format)                          locations#update
                    PUT    /locations/:id(.:format)                          locations#update
                    DELETE /locations/:id(.:format)                          locations#destroy
       example_form GET    /example/form(.:format)                           example#form
   job_applications GET    /job_applications(.:format)                       job_applications#index
                    POST   /job_applications(.:format)                       job_applications#create
new_job_application GET    /job_applications/new(.:format)                   job_applications#new
edit_job_application GET    /job_applications/:id/edit(.:format)              job_applications#edit
    job_application GET    /job_applications/:id(.:format)                   job_applications#show
                    PATCH  /job_applications/:id(.:format)                   job_applications#update
                    PUT    /job_applications/:id(.:format)                   job_applications#update
                    DELETE /job_applications/:id(.:format)                   job_applications#destroy
=end
