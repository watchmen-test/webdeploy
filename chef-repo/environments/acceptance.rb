name 'acceptance'
description 'where we test our code'

cookbook 'apache', '= 0.3.2'
override_attributes({
  "apache" => {
     "port" => 80
   }
})
