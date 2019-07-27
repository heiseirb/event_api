# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                  password_client_user PUT    /client/users/:id/password(.:format)                                                     client/users#password {:format=>:json}
#                          client_users GET    /client/users(.:format)                                                                  client/users#index {:format=>:json}
#                                       POST   /client/users(.:format)                                                                  client/users#create {:format=>:json}
#                           client_user GET    /client/users/:id(.:format)                                                              client/users#show {:format=>:json}
#                                       PATCH  /client/users/:id(.:format)                                                              client/users#update {:format=>:json}
#                                       PUT    /client/users/:id(.:format)                                                              client/users#update {:format=>:json}
#                                       DELETE /client/users/:id(.:format)                                                              client/users#destroy {:format=>:json}
#                         client_events GET    /client/events(.:format)                                                                 client/events#index {:format=>:json}
#                                       POST   /client/events(.:format)                                                                 client/events#create {:format=>:json}
#                          client_event GET    /client/events/:id(.:format)                                                             client/events#show {:format=>:json}
#                                       PATCH  /client/events/:id(.:format)                                                             client/events#update {:format=>:json}
#                                       PUT    /client/events/:id(.:format)                                                             client/events#update {:format=>:json}
#                                       DELETE /client/events/:id(.:format)                                                             client/events#destroy {:format=>:json}
#         client_event_schedule_lottery POST   /client/event_schedules/:event_schedule_id/lottery(.:format)                             client/event_schedules#lottery {:format=>:json}
#           client_event_schedule_apply POST   /client/event_schedules/:event_schedule_id/apply(.:format)                               client/event_schedules#apply {:format=>:json}
#                client_event_schedules POST   /client/event_schedules(.:format)                                                        client/event_schedules#create {:format=>:json}
#                 client_event_schedule PATCH  /client/event_schedules/:id(.:format)                                                    client/event_schedules#update {:format=>:json}
#                                       PUT    /client/event_schedules/:id(.:format)                                                    client/event_schedules#update {:format=>:json}
#                                       DELETE /client/event_schedules/:id(.:format)                                                    client/event_schedules#destroy {:format=>:json}
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  namespace :client, defaults: { format: :json } do
    resources :users do
      member do
        put :password
      end
    end
    resources :events
    resources :event_schedules, only: %i(create update destroy) do
      post :lottery
      post :apply
    end
  end
end
