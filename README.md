# README

## API仕様
### ユーザ
※パラメータはコードを読んでね
```
password_client_user  PUT    /client/users/:id/password(.:format)                         client/users#password 
client_users          GET    /client/users(.:format)                                      client/users#index 
                      POST   /client/users(.:format)                                      client/users#create 
client_user           GET    /client/users/:id(.:format)                                  client/users#show 
                      PATCH  /client/users/:id(.:format)                                  client/users#update 
                      PUT    /client/users/:id(.:format)                                  client/users#update 
                      DELETE /client/users/:id(.:format)                                  client/users#destroy 
```
### ユーザーの参加イベント管理
※Client::JoinSchedules#index ユーザーの参加イベント一覧
※Client::JoinSchedules#show ユーザーの参加イベント詳細
※Client::JoinSchedules#destroy イベントの参加キャンセル
```
client_user_join_schedules GET    /client/users/:user_id/join_schedules(.:format)                                          client/join_schedules#index {:format=>:json}
client_user_join_schedule GET    /client/users/:user_id/join_schedules/:id(.:format)                                      client/join_schedules#show {:format=>:json}
                          DELETE /client/users/:user_id/join_schedules/:id(.:format)                                      client/join_schedules#destroy {:format=>:json}
```
### イベント
※パラメータはコードを読んでね
```
client_events         GET    /client/events(.:format)                                     client/events#index 
                      POST   /client/events(.:format)                                     client/events#create 
client_event          GET    /client/events/:id(.:format)                                 client/events#show 
                      PATCH  /client/events/:id(.:format)                                 client/events#update 
                      PUT    /client/events/:id(.:format)                                 client/events#update 
                      DELETE /client/events/:id(.:format)                                 client/events#destroy 
```
### スケジュール
※lottery: イベントの抽選をするAPI
※apply: イベント予約をするAPI
```
client_event_schedules POST   /client/event_schedules(.:format)                           client/event_schedules#create 
client_event_schedule PATCH  /client/event_schedules/:id(.:format)                        client/event_schedules#update 
                      PUT    /client/event_schedules/:id(.:format)                        client/event_schedules#update 
                      DELETE /client/event_schedules/:id(.:format)                        client/event_schedules#destroy 
                      POST   /client/event_schedules/:event_schedule_id/lottery(.:format) client/event_schedules#lottery
                      POST   /client/event_schedules/:event_schedule_id/apply(.:format)   client/event_schedules#apply
```
## アクセス方法
 - host: https://heiseirb-demo-api.herokuapp.com
 - header
   - X-Token: 4D6(E7{zeeKkfu;
   - X-TokenSecret: password