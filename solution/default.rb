# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.


execute "update-upgrade" do
  command "sudo apt-get update && sudo apt-get upgrade -y"
  action :run
end

package "apache2" do
  action :install
end

service "apache2" do
  action [:enable, :start]
end

s3_file "web-deploy.zip" do
  retries 3
  remote_path 's3 path'
  bucket 'bucket_name'
  aws_access_key_id 'access_key'
  aws_secret_access_key 'secret_key'
  owner 'ubuntu'
  group 'ubuntu'
  mode 00644
  notifies :run, "script[update_app_repository]", :immediately
end

script "update_app_repository" do
  user 'ubuntu'
  interpreter "bash"
  cwd '/opt/application'
  code <<-EOH
    rm -fr web-deploy
    mkdir web-deploy
    unzip 'zip folder path'
    EOH
  action :nothing
end

#template for replacing the root directory path in http.conf