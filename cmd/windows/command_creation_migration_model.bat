start rails generate model Address addressable:references label:string country:string zip_code:string city:string street_number:string street:string additional_address:text
start rails generate model Contact contactable:references email:string telephone:string mobile:string website:string
start rails generate model Company name:string description:text
start rails generate model Supplier name:string description:text
start rails generate model User first_name:string last_name:string email:string login:string password:string token:string salt:string status:integer reference_client:string
start rails generate model UserAction label:string name:string description:text
start rails generate model UserHistory user:references user_action:references detail:text ip:string
start rails generate model UserRole label:string name:string description:text
start rails generate migration CreateUserRoleUserJoinTable

start rails generate model Category sup_category:references label:string name:string description:text
start rails generate model Product reference:string label:string name:string price:float description:text stocks:float supplier:references
start rails generate model Package reference:string label:string name:string price:float description:text
start rails generate migration CreatePackageProductJoinTable
start rails generate model Picture imageable:references path:string label:string name:string description:string

start rails generate model Basket user:references amount:float
start rails generate model Order user:references order_status:references delivery_address:references reference:string amount:float
start rails generate model OrderLine basket_or_order:references package_or_order:references quantity:float amount:float address_delivery:references
start rails generate model OrderStatus label:string name:string description:text
start rails generate model OrderAction label:string name:string description:text
start rails generate model OrderHistory order:references order_action:references detail:text
start rails generate model Bill order:references billing_address:references reference:string mailing_date:datetime