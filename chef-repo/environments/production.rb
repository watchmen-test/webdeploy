name 'production'
description 'where we run production code'

cookbook 'apache', '= 0.3.2'
override_attributes({
  "apache" => {
     "port" => 80
   }
})
